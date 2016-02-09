'use strict';

var app = angular.module('LeagueManager');

app.controller('RankTableCtrl', function ($scope, $rootScope, $http, SettingsService) {

	var loadTable = function () {
		$http.get(SettingsService.backPrefix + 'play_table?filter=id_saison,eq,' + $rootScope.selectedSaisonId)

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
	$rootScope.$watch('selectedSaisonId', loadTable);

	if ($rootScope.selectedSaison != null) {
		loadTable();
	}
});

app.controller('TeamsCtrl', function ($scope, DataService) {
	
	DataService.getTeams().then(function (teams) {
		$scope.teams = teams;
		$scope.predicate = 'name';
		$scope.reverse = true;
		$scope.order = function (predicate) {
			$scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
			$scope.predicate = predicate;
		}
	});
});

app.controller('TeamDetailsCtrl', function ($scope, $routeParams, $http, SettingsService) {

	var url = SettingsService.backPrefix + 'player';
	var method = 'POST';

	if ($routeParams.playerId != 'new') {
		url += '/' + $routeParams.playerId;
		method = 'PUT';

		$http.get(url).then(function (resp) {
			$scope.player = resp.data;
		});
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
				if ($routeParams.articleId == 'new') {
					$location.path('/PlayerDetails/' + response.data);
				}
			}, function failed(response) {
				$scope.error = response.statusText + ": " + response.data;
			});
	}
});
