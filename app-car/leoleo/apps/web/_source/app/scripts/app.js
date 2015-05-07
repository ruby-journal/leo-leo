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
    'ui.router',
    'ngSanitize',
    'ngTouch',
    'restangular'
  ])
  .config(function (
    $stateProvider,
    $urlRouterProvider,
    RestangularProvider
  ) {
    $stateProvider
      .state('/', {
        url: '/',
        templateUrl: 'views/partials/main.html',
        controller: 'MainCtrl'
      })
      .state('/about', {
        url: '/about',
        templateUrl: 'views/partials/about.html',
        controller: 'AboutCtrl'
      });

    $urlRouterProvider.otherwise("/");

    // Config Restangular

    RestangularProvider.setBaseUrl('http://localhost:2300/api/v1');

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
