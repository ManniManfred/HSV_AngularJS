'use strict';

var app = angular.module('LeagueManager');
app.factory('SettingsService', function ($rootScope) {
	
	//$rootScope.title = "Kreisliga Borken";
	//$rootScope.sites = [];
	//$rootScope.teamId = null;

	$rootScope.title = "Holthausener Sportverein";
	$rootScope.sites = [{ 'id': 'History', 'title': "Geschichte" }, { 'id': 'Player/RankHistory', 'title': 'Ewige Liste' }];
	$rootScope.teamId = 3;

	var tableP = 'lm_';
	var backendPath = '../backend/';
	var backend = backendPath + 'data.php/';

	var service = {
		'teamId': $rootScope.teamId,
		'backend': backend,
		'tablePrefix': tableP,
		'backPrefix': backend + tableP,

		GetFunctionUrl(fName) {
			return backendPath + fName + '.php';
		}
	};

	return service;
});
