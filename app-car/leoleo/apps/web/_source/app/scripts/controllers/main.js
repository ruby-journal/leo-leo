'use strict';

/**
 * @ngdoc function
 * @name webAppMdcarApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the webAppMdcarApp
 */
angular.module('webAppMdcarApp')
  .controller('MainCtrl', function ($scope, Eservices) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];

    Eservices
      .getUser()
      .then(function(res){
        console.log(res);
      });
  });
