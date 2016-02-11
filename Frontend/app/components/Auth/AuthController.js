'use strict';

var app = angular.module('LeagueManager');

app.controller('LogoutCtrl', function ($scope, $http, UserService) {
	UserService.logout();
});

app.controller('LoginCtrl', function ($scope, $location, $http, UserService) {
	$scope.login = function () {
		UserService.login($scope.vm.username, $scope.vm.password).then(function (resp) {
			$scope.message = resp.message;
			if (resp.result) {
				$location.path('/');
			}
		});

		return true;
	};
});

app.controller('UserCtrl', function ($scope, $routeParams, $http, UserService, SettingsService) {

	var url = SettingsService.backPrefix + 'users';
	var method = 'POST';

	if ($routeParams.userId != 'new') {
		url += '/' + $routeParams.userId;
		method = 'PUT';

		$http.get(url).then(function (resp) {
			$scope.user = resp.data;
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