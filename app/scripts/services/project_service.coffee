'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.factory:Project

 # @description
 # Controller of the backloggWebApp
###
angular.module('projectServices', ['ngResource'])

  .factory 'Project', ['$resource', ($resource) ->

    $resource('http://localhost:9292/api/v1/projects/:projectId', {}
      # all:
      #   method: "GET"
      #   isArray: true
      # find_by_id:
      #   method: "GET"
    )

  ]