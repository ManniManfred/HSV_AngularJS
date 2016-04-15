'use strict';

var app = angular.module('LeagueManager');
app.factory('SettingsService', function ($rootScope) {
	
	$rootScope.title = "Holthausener Sportverein";
	$rootScope.sites = [{ 'id': 'History', 'title': "Geschichte" }, { 'id': 'Player/RankHistory', 'title': 'Ewige Liste' }];
	$rootScope.teamId = 3;
	$rootScope.favicon = "assets/img/HsvWeb.ico";
	
	var tableP = 'lm_';
	var backendPath = '../../../Backend/';
	var backend = backendPath + 'Data.php/';

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
