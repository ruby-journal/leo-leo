'use strict';

/**
 * @ngdoc service
 * @name webAppMdcarApp.services
 * @description
 * # services
 * Factory in the webAppMdcarApp.
 */
angular.module('webAppMdcarApp')
  .factory('services', function () {
    // Service logic
    // ...

    var meaningOfLife = 42;

    // Public API here
    return {
      someMethod: function () {
        return meaningOfLife;
      }
    };
  });
