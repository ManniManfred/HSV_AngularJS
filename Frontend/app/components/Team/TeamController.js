'use strict';

var app = angular.module('LeagueManager');

app.controller('RankTableCtrl', function ($scope, $rootScope, $http, SettingsService) {

	var loadTable = function () {
		$http.get(SettingsService.backPrefix + 'play_table?filter=id_saison,eq,' + $rootScope.selectedSaison.id)

        .then(function (matchResp) {
        	$scope.place = php_crud_api_transform(matchResp.data)[SettingsService.tablePrefix + "play_table"];

        	for (var i = 0; i < $scope.place.length; i++) {
        		var m = $scope.place[i];

        		m.defeat = m.match_count - m.wins - m.stand_off;
        		m.points = m.wins * 3 + m.stand_off;
        		m.goal_diff = m.shoot - m.got;
        	}

        	$scope.place.sort(function (a, b) {
        		return b.points - a.points;
        	});

        	for (var i = 0; i < $scope.place.length; i++) {
        		var m = $scope.place[i];
        		m.rank = i + 1;
        	}

        	$scope.predicate = 'rank';
        	$scope.reverse = false;
        	$scope.order = function (predicate) {
        		$scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
        		$scope.predicate = predicate;
        	}
        });
	};
	$rootScope.$watch('selectedSaison', loadTable);

	if ($rootScope.selectedSaison != null) {
		loadTable();
	}
});

app.controller('TeamsCtrl', function ($scope, DataService) {
	
	DataService.getTeams().then(function (teams) {
		$scope.teams = teams;
		$scope.predicate = 'name';
		$scope.reverse = false;
		$scope.order = function (predicate) {
			$scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
			$scope.predicate = predicate;
		}
	});

	$scope.deleteTeam = function (team) {
		if (confirm("Sind Sie sicher, dass die Mannschaft \"" + team.name + "\" gelöscht werden soll?")) {
			DataService.deleteTeam(team).then(function (deleteResult) {
				if (!deleteResult)
					alert("Das Löschen ist fehlgeschlagen.");
			});
		}
	};
});

app.controller('TeamDetailsCtrl', function ($scope, $routeParams, $location, $http, DataService, SettingsService) {


	var url = SettingsService.backPrefix + 'team';
	var method = 'POST';

	if ($routeParams.teamId != 'new') {
		url += '/' + $routeParams.teamId;
		method = 'PUT';

		DataService.getTeams(true).then(function (teams) {
			$scope.team = teams[$routeParams.teamId];
		});
	}

	$scope.save = function () {
		$scope.error = null;

		if (!$scope.frm.$dirty) {
			var directP = $q.defer();
			setTimeout(function () { directP.resolve(true); }, 0);
			return directP;
		}

		var data = $scope.team;

		return $http({ "method": method, "url": url, "data": data })
			.then(function success(response) {
				$scope.error = null;
				if ($routeParams.teamId == 'new') {
					if (!response.data)
						$scope.error = 'Das Anlegen diesen neuen Spielers ist fehlgeschlagen';
					else {
						DataService.clearTeamsCache();
						$location.path('/TeamDetails/' + response.data);
					}
				}
			}, function failed(response) {
				$scope.error = response.statusText + ": " + response.data;
			});
	}

	$scope.saveAndClose = function () {
		$scope.save().then(function () {
			//window.history.back();
			$location.path('/Teams');
		})
	}
});
