'use strict';

var app = angular.module('LeagueManager');


app.controller('MatchesCtrl', function ($scope, $rootScope, $http, SettingsService) {
	var url = SettingsService.backPrefix + 'matches';
	

	var leadingZeros = function(num, size) {
		var s = "000000000" + num;
		return s.substr(s.length-size);
	}

	var loadTable = function () {
		if ($rootScope.selectedSaison == null)
			return;

		if (SettingsService.teamId == null)
			url += '?satisfy=all&filter[]=saison_id,eq,' + $rootScope.selectedSaison.id
				+ '&filter[]=type,eq,TOURNAMENT';
		else {
			var key1 = $rootScope.selectedSaison.id + leadingZeros(SettingsService.teamId, 3) + '___';
			var key2 = $rootScope.selectedSaison.id + '___' + leadingZeros(SettingsService.teamId, 3);
			url += '?satisfy=any&filter[]=my_key,like,' + key1 + '&filter[]=my_key,like,' + key2;
		}
		$http.get(url)

			.then(function (matchResp) {
				$scope.matches = php_crud_api_transform(matchResp.data)[SettingsService.tablePrefix + "matches"];
				$scope.predicate = 'date';
				$scope.reverse = false;
				$scope.order = function (predicate) {
					$scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
					$scope.predicate = predicate;
				}
			});
	}

	$rootScope.$watch('selectedSaison', loadTable);

	if ($rootScope.selectedSaison != null)
		loadTable();
});

app.controller('MatchDetailsCtrl', function ($scope, $routeParams, $http, SettingsService) {
	$http.get(SettingsService.backPrefix + 'matches?filter=id,eq,' + $routeParams.matchId).then(function (matchResp) {
		$scope.m = php_crud_api_transform(matchResp.data)[SettingsService.tablePrefix + 'matches'][0];

		// get saison teams
	});
});
