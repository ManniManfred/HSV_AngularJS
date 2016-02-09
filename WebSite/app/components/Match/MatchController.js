'use strict';

var app = angular.module('LeagueManager');

app.controller('MatchesCtrl', function ($scope, $http, SettingsService) {
	var url = SettingsService.backPrefix + 'matches';
	if (SettingsService.teamId != null)
		url += '?satisfy=any&filter[]=team1_id,eq,' + SettingsService.teamId + '&filter[]=team2_id,eq,' + SettingsService.teamId;

	$http.get(url)

        .then(function (matchResp) {
        	$scope.matches = php_crud_api_transform(matchResp.data)[SettingsService.tablePrefix + "matches"];
        	$scope.predicate = 'date';
        	$scope.reverse = true;
        	$scope.order = function (predicate) {
        		$scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
        		$scope.predicate = predicate;
        	}
        });
});

app.controller('MatchDetailsCtrl', function ($scope, $routeParams, $http, SettingsService) {
	$http.get(SettingsService.backPrefix + 'matches?filter=id,eq,' + $routeParams.matchId).then(function (matchResp) {
		$scope.m = php_crud_api_transform(matchResp.data)[SettingsService.tablePrefix + 'matches'][0];
	});
});
