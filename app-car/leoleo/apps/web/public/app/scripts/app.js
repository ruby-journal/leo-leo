'use strict';

/**
 * @ngdoc overview
 * @name webAppMdcarApp
 * @description
 * # webAppMdcarApp
 *
 * Main module of the application.
 */
angular
  .module('webAppMdcarApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'restangular'
  ])
  .config(function (
    $routeProvider,
    $httpProvider,
    RestangularProvider
  ) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/partials/main.html',
        controller: 'MainCtrl'
      })
      .when('/about', {
        templateUrl: 'views/partials/about.html',
        controller: 'AboutCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });

    // Config Restangular

    RestangularProvider.setBaseUrl('http://localhost:2300/api/v1');
    $httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
    RestangularProvider.setResponseExtractor(function(response, operation) {
      var newResponse = response;
      if (operation === 'getList') {
        if (response.meta) {
          newResponse = response.results;
          newResponse.metadata = response.meta;
        }
      }
      return newResponse;
    });
  });
