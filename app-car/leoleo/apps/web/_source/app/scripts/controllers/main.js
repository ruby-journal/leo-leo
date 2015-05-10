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
    Eservices
      .getUser()
      .then(function(res){
        $scope.users = res;
      });
  });
