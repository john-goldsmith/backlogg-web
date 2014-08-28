'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.factory:Column

 # @description
 # Controller of the backloggWebApp
###
angular.module('columnServices', ['ngResource'])

  .factory 'Column', ['$resource', ($resource) ->

    $resource('http://localhost:9292/api/v1/projects/:projectId/columns', {}
      isArray: true
      # all:
      #   method: "GET"
      #   isArray: true
      # find_by_id:
      #   method: "GET"
    )

  ]