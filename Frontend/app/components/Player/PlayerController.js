'use strict';

var app = angular.module('LeagueManager');

app.controller('PlayerSaisonCtrl', function ($q, $scope, $rootScope, $http, DataService, SettingsService) {

	$scope.rankTitle = 'Torjäger';
	$scope.isSaison = true;
	
	var loadTable = function () {
		if ($rootScope.selectedSaison == null)
			return;

		$scope.rankTitle = 'Torjäger der Saison ' + $rootScope.selectedSaison.name;

		var url = SettingsService.backPrefix + 'scorer';
		url += "?satisfy=all&filter[]=id_saison,eq," + $rootScope.selectedSaison.id
		if (SettingsService.teamId != null)
			url += '&filter[]=id_team,eq,' + SettingsService.teamId;

		var playerPromise = $http.get(url).then(function (spielerResponse) {
			return php_crud_api_transform(spielerResponse.data)[SettingsService.tablePrefix + "scorer"];
		});
		var teamPromise = DataService.getTeams(true);
		$q.all([playerPromise, teamPromise]).then(function (results) {

			var playersArr = results[0];
			var teamsMap = results[1];
			var playerFiltered = [];

			for (var i = 0; i < playersArr.length; i++) {
				var curPla = playersArr[i];
				curPla.team = teamsMap[curPla.id_team];

				// workaround to use same view for hist and saison
				curPla.count_goals = curPla.goals == null ? 0 : curPla.goals;
				if (curPla.goals != null && curPla.count_goals != 0)
					playerFiltered.push(curPla);
			}

			$scope.player = playerFiltered;
			$scope.predicate = 'count_goals';
			$scope.reverse = true;
			$scope.order = function (predicate) {
				$scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
				$scope.predicate = predicate;
			}
		});
	}

	$rootScope.$watch('selectedSaison', loadTable);

	if ($rootScope.selectedSaison != null)
		loadTable();

	$scope.deletePlayer = function (player) {
		if (confirm("Sind Sie sicher, dass der Spieler \"" + player.firstname + " " + player.lastname + "\" gelöscht werden soll?")) {
			DataService.deletePlayer(player).then(function (deleteResult) {
				if (!deleteResult)
					alert("Das Löschen ist fehlgeschlagen.");
			});
		}
	}
});

app.controller('PlayerCtrl', function ($filter, $scope, $http, SettingsService, DataService) {

	$scope.rankTitle = 'Ewige Liste';
	$scope.isSaison = false;
	
	var promisePlayer = DataService.getPlayer();
	promisePlayer.then(function (player) {
		if (SettingsService.teamId != null)
			$scope.player = $filter('filter')(player, {'id_team': SettingsService.teamId });
		else
			$scope.player = player;
		
		$scope.predicate = 'count_goals';
		$scope.reverse = true;
		$scope.order = function (predicate) {
			$scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
			$scope.predicate = predicate;
		}
	});

	$scope.deletePlayer = function(player) {
		if (confirm("Sind Sie sicher, dass der Spieler \"" + player.firstname + " " + player.lastname + "\" gelöscht werden soll?")) {
			DataService.deletePlayer(player).then(function (deleteResult) {
				if (!deleteResult)
					alert("Das Löschen ist fehlgeschlagen.");
			});
		}
	}
});

app.controller('PlayerDetailsCtrl', function ($scope, $location, $routeParams, $http, DataService, SettingsService) {

	var url = SettingsService.backPrefix + 'player';
	var method = 'POST';

	if ($routeParams.playerId != 'new') {
		url += '/' + $routeParams.playerId;
		method = 'PUT';

		$http.get(url).then(function (resp) {
			$scope.player = resp.data;
		});
	} else {
		$scope.player = { 'id_team': SettingsService.teamId };
	}

	$scope.save = function () {

		$scope.error = null;

		if (!$scope.frm.$dirty) {
			var directP = $q.defer();
			setTimeout(function () { directP.resolve(true); }, 0);
			return directP;
		}

		var data = $scope.player;

		return $http({ "method": method, "url": url, "data": data })
			.then(function success(response) {
				$scope.error = null;
				if ($routeParams.playerId == 'new') {
					if (!response.data)
						$scope.error = 'Das Anlegen diesen neuen Spielers ist fehlgeschlagen';
					else {
						DataService.clearPlayerCache();
						$location.path('/Player/Details/' + response.data);
					}
				}
			}, function failed(response) {
				$scope.error = response.statusText + ": " + response.data;
			});
	}
});
