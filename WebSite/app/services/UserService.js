'use strict';

var app = angular.module('LeagueManager');
app.factory('UserService', function ($http, $rootScope, SettingsService) {
	var service = {
		_setCurrentUser: function (user) {
			$rootScope.currentUser = angular.isObject(user) ? user : null;
		},
		getSelf: function () {
			return $http.post(SettingsService.GetFunctionUrl("GetSelf"))
                .then(function (resp) {
                	service._setCurrentUser(resp.data);
                });
		},
		login: function (username, password) {
			return $http.post(SettingsService.GetFunctionUrl("Login"), {
				"username": username,
				"password": password
			}).then(function (resp) {
				if (resp.data.result == true) {
					service._setCurrentUser(resp.data.user);
				}
				return resp.data;
			});
		},
		logout: function () {
			return $http.post(SettingsService.GetFunctionUrl("Logout"))
            .then(function () {
            	service._setCurrentUser(null);
            });
		}
	};

	$rootScope.hasRight = function (neededRight) {
		if ($rootScope.currentUser == null)
			return false;

		if (neededRight == "editArticle" || neededRight == "createArticle"
			|| neededRight == "deleteRight"
			|| neededRight == "editMasterData") {
			return $rootScope.currentUser.rights == 'ADMIN';
		}
		return false;
	};

	service._setCurrentUser(null);
	service.getSelf();
	return service;
});