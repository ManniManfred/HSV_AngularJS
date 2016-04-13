'use strict';

var app = angular.module('LeagueManager');


app.controller('MatchesCtrl', function ($scope, $rootScope, $http, SettingsService) {
	
	var leadingZeros = function (num, size) {
		var s = "000000000" + num;
		return s.substr(s.length - size);
	}

	var loadTable = function () {
		if ($rootScope.selectedSaison == null)
			return;
		
		var url = SettingsService.backPrefix + 'matches';
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

	$scope.deleteMatch = function (match) {
		if (confirm("Sind Sie sicher, dass das Spiel \"" + match.team1_name + " vs " + match.team2_name + "\" gelöscht werden soll?")) {
			var url = SettingsService.backPrefix + 'match' + '/' + match.id;
			$http.delete(url).then(function (resp) {
				if (resp.data != 1)
					alert("Das Löschen ist fehlgeschlagen.");
				else {
					var deletedIndex = -1;
					for (var i = 0; i < $scope.matches.length; i++) {
						if ($scope.matches[i].id == match.id) {
							deletedIndex = i;
							break;
						}
					}

					if (deletedIndex >= 0) {
						$scope.matches.splice(deletedIndex, 1);
					}
				}
			});
		}
	};

	$rootScope.$watch('selectedSaison', loadTable);

	if ($rootScope.selectedSaison != null)
		loadTable();
});

app.controller('MatchDetailsCtrl', function ($q, $filter, $location, $scope, $rootScope, $routeParams, $http, SettingsService, DataService) {
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
			$scope.m.date = $filter('dateTime')($scope.m.date);
		});
		$scope.m = {};
	} else {
		$scope.m = { 'date': $filter('dateTime')(new Date()), 'goal1': 0, 'goal2': 0, 'type': 'FRIEND' };
	}


	$scope.saisonTeamsMap = {};
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

	var matchPlayerMap = null;
	var matchPlayerArr = null;

	var getMatchPlayer = function (asMap) {
		if ($routeParams.matchId == 'new') {
			matchPlayerMap = {};
			matchPlayerArr = [];
		}

		if (matchPlayerMap != null) {
			var defer = $q.defer();
			setTimeout(function () { defer.resolve(asMap ? matchPlayerMap : matchPlayerArr); }, 0);
			return defer.promise;
		}

		var url = SettingsService.backPrefix + 'match_player'
			+ '?filter=id_match,eq,' + $routeParams.matchId;

		return $http.get(url).then(function (matchPlayerResponse) {
			matchPlayerArr = php_crud_api_transform(matchPlayerResponse.data)[SettingsService.tablePrefix + 'match_player'];
			matchPlayerMap = {};

			for (var i = 0; i < matchPlayerArr.length; i++) {
				var item = matchPlayerArr[i];
				matchPlayerMap[item.id_player] = item;
			}
			return asMap ? matchPlayerMap : matchPlayerArr;
		});
	};

	var loadPlayer = function (number) {
		var st = $scope.saisonTeamsMap[$scope.m['id_saison_team' + (number + 1)]];
		if (st == null)
			return;

		DataService.getPlayer().then(function (player) {
			
			getMatchPlayer(true).then(function (mapMatchPlayer) {
				var playerArr = [];
				
				for (var i = 0; i < player.length; i++) {
					if (player[i].id_team == st.id_team) {
						var matchPlayerResult = {
							'firstname': player[i].firstname,
							'lastname': player[i].lastname,
							'id': player[i].id,
							'id_team': player[i].id_team
						};

						var matchPlayer = mapMatchPlayer[player[i].id];
						matchPlayerResult.checked = matchPlayer != null;

						if (matchPlayer != null) {
							matchPlayerResult.goals = matchPlayer.goals;
							matchPlayerResult.hasYellowCard = matchPlayer.hasYellowCard;
							matchPlayerResult.hasYellowRedCard = matchPlayer.hasYellowRedCard;
							matchPlayerResult.hasRedCard = matchPlayer.hasRedCard;
						}
						playerArr.push(matchPlayerResult);
					}
				}

				$scope.playerTeam[number] = playerArr;
			})
		});
	};

	$scope.savePlayer = function (number) {
		if ($scope.playerTeam == null)
			return;

		if ($scope.playerTeam[number] == null)
			return;
		
		if ($routeParams.matchId == 'new') {
			alert("Es muss zuerst das Spiel gespeichert werden.");
			return;
		}

		var st = $scope.saisonTeamsMap[$scope.m['id_saison_team' + (number + 1)]];
		if (st == null)
			return;

		var playerToStore = [];
		var origArr = $scope.playerTeam[number];
		for (var i = 0; i < origArr.length; i++)
		{
			if (origArr[i].checked)
				playerToStore.push(origArr[i]);
		}

		return $http({
			"method": "post",
			"url": SettingsService.backendPath + "SaveMatchPlayer.php",
			"data": {
				"matchId": $routeParams.matchId,
				"saisonTeamId": st.id,
				"player": playerToStore
			}
		}).then(function success(response) {
				if (response.data != 1)
					alert("Spieler Zuordnung konnte nicht gespeichert werden.");
			}, function failed(response) {
				$scope.error = response.statusText + ": " + response.data;
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

		var match = JSON.parse(JSON.stringify($scope.m));
		match.date = moment($scope.m.date, "DD.MM.YYYY HH:mm").format("YYYY-MM-DD HH:mm:ss");
		match.goal1 = parseInt($scope.m.goal1);
		match.goal2 = parseInt($scope.m.goal2);

		return $http({ "method": method, "url": url, "data": match })
			.then(function success(response) {
				if ($routeParams.matchId == 'new') {
					$location.path('/MatchDetails/' + response.data);
				}
			}, function failed(response) {
				$scope.error = response.statusText + ": " + response.data;
			});
	};

	$scope.saveAndClose = function () {
		$scope.save().then(function () {
			$location.path('/Matches');
		})
	};

});


app.controller('MatchPlayers1Ctrl', function ($scope) {
	$scope.number = 0;
});

app.controller('MatchPlayers2Ctrl', function ($scope) {
	$scope.number = 1;
});
