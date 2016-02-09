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