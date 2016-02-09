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
});

app.controller('PlayerDetailsCtrl', function ($scope, $routeParams, $http, SettingsService) {

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
