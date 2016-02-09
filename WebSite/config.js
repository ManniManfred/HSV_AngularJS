'use strict';

var app = angular.module('LeagueManager');
app.factory('SettingsService', function ($rootScope) {
	
	$rootScope.title = "Kreisliga Borken";
	$rootScope.sites = [];

	$rootScope.title = "Holthausener Sportverein";
	$rootScope.sites = [{ id: 'History', 'title': "Geschichte" }];

	var tableP = 'lm_';
	var backendPath = '../backend/';
	var backend = backendPath + 'data.php/';

	var service = {
		'teamId': 'null',
		'backend': backend,
		'tablePrefix': tableP,
		'backPrefix': backend + tableP,

		GetFunctionUrl(fName) {
			return backendPath + fName + '.php';
		}
	};

	return service;
});