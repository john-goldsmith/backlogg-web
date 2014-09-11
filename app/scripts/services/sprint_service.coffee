'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.factory:Sprint

 # @description
 # Controller of the backloggWebApp
###
angular.module('sprintServices', ['ngResource'])

  .factory 'Sprint', ['$resource', ($resource) ->

    $resource('http://localhost:9292/api/v1/projects/:projectId/sprints',
      id: "@id"
    ,
      all:
        method: "GET"
        isArray: true
    )

  ]