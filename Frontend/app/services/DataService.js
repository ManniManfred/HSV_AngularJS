'use strict';

var app = angular.module('LeagueManager');
app.factory('DataService', function ($q, $http, $rootScope, SettingsService) {
	var saisonMap = null;
	var saisonArr = null;
	var defaultSaison = null;
	var teamsMap = null;
	var teamsArr = null;
	var playersMap = null;
	var playersArr = null;

	var service = {
		getSaisons: function (asMap) {
			if (saisonMap == null) {
				var url = SettingsService.backPrefix + 'saison';
				return $http.get(url).then(function (spielerResponse) {
					saisonArr = php_crud_api_transform(spielerResponse.data)[SettingsService.tablePrefix + 'saison'];
					saisonMap = {};
					for (var i = 0; i < saisonArr.length; i++) {
						var saison = saisonArr[i];
						saisonMap[saison.id] = saison[i];

						if (saison.isDefault)
							defaultSaison = saison;
					}
					return asMap ? saisonMap : saisonArr;
				});
			}

			var defer = $q.defer();
			setTimeout(function () { defer.resolve(asMap ? saisonMap : saisonArr); }, 0);
			return defer.promise;
		},
		getDefaultSaison: function(){
			return service.getSaisons().then(function () {
				return defaultSaison;
			});
		},
		getTeams: function(asMap) {
			if (teamsMap == null) {
				var url = SettingsService.backPrefix + 'team';
				return $http.get(url).then(function (spielerResponse) {
					teamsArr = php_crud_api_transform(spielerResponse.data)[SettingsService.tablePrefix + "team"];
					teamsMap = {};
					for (var i = 0; i < teamsArr.length; i++)
					{
						teamsMap[teamsArr[i].id] = teamsArr[i];
					}
					return asMap ? teamsMap : teamsArr;
				});
			}

			var defer = $q.defer();
			setTimeout(function () { defer.resolve(asMap ? teamsMap : teamsArr); }, 0);
			return defer.promise;
		},
		getPlayer: function(asMap) {
			if (playersMap == null) {
				var url = SettingsService.backPrefix + 'player';
				if (SettingsService.teamId != null)
					url += '?filter=id_team,eq,' + SettingsService.teamId;
			
				var playerPromise = $http.get(url).then(function (spielerResponse) {
					return php_crud_api_transform(spielerResponse.data)[SettingsService.tablePrefix + "player"];
				});
				var teamPromise = service.getTeams(true);
				return $q.all([playerPromise, teamPromise]).then(function (results) {
					playersArr = results[0];
					playersMap = {};
					for (var i = 0; i < playersArr.length; i++) {
						var curPla = playersArr[i];
						curPla.team = teamsMap[curPla.id_team];
						playersMap[curPla.id] = curPla;
					}
					return asMap ? playersMap : playersArr;
				});
			}

			var defer = $q.defer();
			setTimeout(function () { defer.resolve(asMap ? playersMap : playersArr); }, 100);
			return defer.promise;
		}
	};

	return service;
});