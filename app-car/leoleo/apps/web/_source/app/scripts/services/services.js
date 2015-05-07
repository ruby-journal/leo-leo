'use strict';

/**
 * @ngdoc service
 * @name webAppMdcarApp.services
 * @description
 * # services
 * Factory in the webAppMdcarApp.
 */
angular.module('webAppMdcarApp')
  .factory('Eservices', function (Restangular) {
    // Service logic
    // ...

    var service = Restangular.all('users');

    // Public API here
    return {
      getUser: function () {
        return service.getList();
      }
    };
  });
