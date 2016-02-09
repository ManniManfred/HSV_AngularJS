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

