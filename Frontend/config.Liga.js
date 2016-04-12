'use strict';

var app = angular.module('LeagueManager');
app.factory('SettingsService', function ($rootScope) {
	
	$rootScope.title = "Kreisliga Borken";
	$rootScope.sites = [];
	$rootScope.teamId = null;

	var tableP = 'lm_';
	var backendPath = '../../../backend/';
	var backend = backendPath + 'data.php/';

	var service = {
		'teamId': $rootScope.teamId,
		'backendPath': backendPath,
		'backend': backend,
		'tablePrefix': tableP,
		'backPrefix': backend + tableP,

		GetFunctionUrl(fName) {
			return backendPath + fName + '.php';
		}
	};

	return service;
});
