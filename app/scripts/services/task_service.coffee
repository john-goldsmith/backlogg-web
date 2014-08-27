'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.factory:Task

 # @description
 # Controller of the backloggWebApp
###
angular.module('taskServices', ['ngResource'])

  .factory 'Task', ['$resource', ($resource) ->

    $resource('http://localhost:9292/api/v1/projects/:projectId/tasks', {}
      isArray: true
      # all:
      #   method: "GET"
      #   isArray: true
      # find_by_id:
      #   method: "GET"
    )

  ]