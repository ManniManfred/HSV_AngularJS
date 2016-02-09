'use strict';

var app = angular.module('LeagueManager');

app.controller('ArticlesCtrl', function ($scope, $http, SettingsService) {
	var tableName = 'article';
	// TODO: perhaps only first entries + '?order=id&page=1,2'
	$http.get(SettingsService.backPrefix + tableName + '?order=created,desc').then(function (spielerResponse) {
		$scope.articles = php_crud_api_transform(spielerResponse.data)[SettingsService.tablePrefix + tableName];
	});
});

app.controller('DeleteArticleCtrl', function ($scope, $location, $routeParams, $http, SettingsService) {

	var url = SettingsService.backPrefix + 'article' + '/' + $routeParams.articleId;;
	$http.delete(url).then(function ($resp) {
		$location.path('/');
	});
});

app.controller('EditArticleCtrl', function ($q, $scope, $location, $routeParams, $http, SettingsService) {
	$scope.$on("ckeditor.ready", function (event) {
		$scope.isReady = true;
	});

	var url = SettingsService.backPrefix + 'article';
	var method = 'POST';

	if ($routeParams.articleId != 'new') {
		url += '/' + $routeParams.articleId;
		method = 'PUT';

		$http.get(url).then(function (resp) {
			$scope.article = resp.data;
			$scope.title = resp.data.title;
			$scope.editorContent = resp.data.content;
		});
	}

	$scope.save = function () {
		//$scope.article.title = $scope.title;
		$scope.error = null;

		if (!$scope.frm.$dirty) {
			var directP = $q.defer();
			setTimeout(function () { directP.resolve(true); }, 0);
			return directP;
		}

		var data = { 'id': $scope.article.id, 'title': $scope.article.title };

		if ($scope.frm.editor.$dirty) {
			data.content = $scope.editorContent;
		}

		return $http({ "method": method, "url": url, "data": data })
			.then(function success(response) {
				if ($routeParams.articleId == 'new') {
					$location.path('/EditArticle/' + response.data);
				}
			}, function failed(response) {
				$scope.error = response.statusText + ": " + response.data;
			});
	}

	$scope.saveAndClose = function () {
		$scope.save().then(function () {
			$location.path('/');
		})
	}
});
