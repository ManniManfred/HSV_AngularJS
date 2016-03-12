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

app.controller('MatchDetailsCtrl', function ($q, $filter, $scope, $rootScope, $routeParams, $http, SettingsService, DataService) {
	$scope.$on("ckeditor.ready", function (event) {
		$scope.isReady = true;
	});

	var url = SettingsService.backPrefix + 'match';
	var method = 'POST';

	if ($routeParams.matchId != 'new') {
		url += '/' + $routeParams.matchId;
		method = 'PUT';

		$http.get(url).then(function (matchResp) {
			$scope.m = matchResp.data;
		});
	} else {
		$scope.m = { 'date': new Date(), 'goal1': 0, 'goal2' : 0, 'type': 'TOURNAMENT' };
	}

	
	$scope.saisonTeamsMap = {};
	$scope.m = {};
	$scope.playerTeam = [];
	$scope.playerTeam[0] = [];
	$scope.playerTeam[1] = [];

	var loadSaisonTeams = function () {
		if ($rootScope.selectedSaison == null)
			return;
		
		var teamPromise = DataService.getTeams(true);
		var saisonTeamPromise = $http.get(SettingsService.backPrefix 
			+ 'saison_team?filter=id_saison,eq,' 
			+ $rootScope.selectedSaison.id);

		$q.all([saisonTeamPromise, teamPromise]).then(function (results) {

			var teams = results[1];

			var saisonTeams = php_crud_api_transform(results[0].data)[SettingsService.tablePrefix + 'saison_team'];
			var saisonTeamsMap = {};

			for (var i = 0; i < saisonTeams.length; i++) {
				var st = saisonTeams[i];
				st.team = teams[st.id_team];
				saisonTeamsMap[st.id] = st;
			}
			$scope.saisonTeams = saisonTeams;
			$scope.saisonTeamsMap = saisonTeamsMap;
		});
	};

	$rootScope.$watch('selectedSaison', loadSaisonTeams);

	if ($rootScope.selectedSaison != null)
		loadSaisonTeams();

	var loadPlayer = function (number) {
		var st = $scope.saisonTeamsMap[$scope.m['id_saison_team' + (number + 1)]];
		if (st == null)
			return;

		DataService.getPlayer().then(function (player) {
			$scope.playerTeam[number] = $filter('filter')(player, { 'id_team': st.id_team });
		});
	};

	$scope.$watch('saisonTeamsMap', function () { loadPlayer(0); loadPlayer(1); });
	$scope.$watch('m', function () { loadPlayer(0); loadPlayer(1); });
	$scope.$watch('m.id_saison_team1', function () { loadPlayer(0); });
	$scope.$watch('m.id_saison_team2', function () { loadPlayer(1); });

	$scope.getSaisonTeam = function (number) {
		var result = null;
		if ($scope.saisonTeamsMap != null && $scope.m != null)
			result = $scope.saisonTeamsMap[$scope.m['id_saison_team' + (number + 1)]];

		return result;
	};


	$scope.save = function () {
		//$scope.article.title = $scope.title;
		$scope.error = null;

		if (!$scope.frm.$dirty) {
			var directP = $q.defer();
			setTimeout(function () { directP.resolve(true); }, 0);
			return directP;
		}

		var match = $scope.m;

		if ($scope.frm.editor.$dirty) {
			match.description = $scope.editorContent;
		}

		return $http({ "method": method, "url": url, "data": match })
			.then(function success(response) {
				if ($routeParams.matchId == 'new') {
					$location.path('/MatchDetails/' + response.data);
				}
			}, function failed(response) {
				$scope.error = response.statusText + ": " + response.data;
			});
	}

	$scope.saveAndClose = function () {
		$scope.save().then(function () {
			window.history.back();
		})
	}
});


app.controller('MatchPlayers1Ctrl', function ($scope) {
	$scope.number = 0;
});

app.controller('MatchPlayers2Ctrl', function ($scope) {
	$scope.number = 1;
});
