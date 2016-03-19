'use strict';

var app = angular.module('LeagueManager');

app.filter("imageName", [function () {
	return function (playerObj) {
		if (playerObj == null)
			return "undefined";

		return (playerObj.firstname + "_" + playerObj.lastname).replace(" ", "_");
	}
}]);

app.filter('dateTime', function ($filter) {
	return function (input) {
		if (input == null)
			return "undefined";
		return $filter('date')(new Date(input), 'dd.MM.yyyy HH:mm');
	};
});

app.filter('matchType', function () {
	return function (input) {
		if (input == null)
			return "Unbekannt";
		if (input == 'TOURNAMENT')
			return 'L';
		if (input == 'FRIEND')
			return 'F';

		return input;
	};
});

app.filter('matchTypeLong', function () {
	return function (input) {
		if (input == null)
			return "Unbekannt";
		if (input == 'TOURNAMENT')
			return 'Ligaspiel';
		if (input == 'FRIEND')
			return 'Freundschaftsspiel';

		return input;
	};
});
