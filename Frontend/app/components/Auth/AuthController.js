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

app.controller('UserCtrl', function ($scope, $routeParams, $http, DataService, UserService, SettingsService) {

	DataService.getTeams(false).then(function (teams) {
		$scope.teams = teams;
	});

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

		var data = $scope.user;

		return $http({ "method": method, "url": url, "data": data })
			.then(function success(response) {
				if ($routeParams.userId == 'new') {
					$location.path('/User/' + response.data);
				}
			}, function failed(response) {
				$scope.error = response.statusText + ": " + response.data;
			});
	}
});

app.controller('UsersCtrl', function ($scope, $http, SettingsService, DataService) {
	var url = SettingsService.backPrefix + 'users';

	$http.get(url).then(function (usersReps) {
		var users = php_crud_api_transform(usersReps.data)[SettingsService.tablePrefix + 'users'];

		DataService.getTeams(true).then(function (teamsMap) {
			for (var i = 0; i < users.length; i++)
			{
				var user = users[i];
				user.team = teamsMap[user.id_team];
			}
			$scope.users = users;
			$scope.predicate = 'firstname';
			$scope.reverse = true;
			$scope.order = function (predicate) {
				$scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
				$scope.predicate = predicate;
			}
		});
		



		
	});
});

