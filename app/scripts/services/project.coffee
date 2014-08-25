'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.factory:Projects

 # @description
 # Controller of the backloggWebApp
###
angular.module('projectServices', ['ngResource'])

  .factory 'Project', ['$resource', ($resource) ->

    $resource('http://localhost:9292/api/v1/projects/:projectId', {}
      find_by_id:
        method: "GET"
    )

  ]