'use strict';

var app = angular.module('LeagueManager');

app.controller('PlayerSaisonCtrl', function ($scope, $http, DataService) {
	var promisePlayer = DataService.getPlayer();
	promisePlayer.then(function (player) {
		$scope.player = player;
		$scope.predicate = 'count_goals';
		$scope.reverse = true;
		$scope.order = function (predicate) {
			$scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
			$scope.predicate = predicate;
		}
	});
});

app.controller('PlayerCtrl', function ($scope, $http, DataService) {
	var promisePlayer = DataService.getPlayer();
	promisePlayer.then(function (player) {
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
