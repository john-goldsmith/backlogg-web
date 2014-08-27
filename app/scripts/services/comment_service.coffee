'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.factory:Comment

 # @description
 # Controller of the backloggWebApp
###
angular.module('commentServices', ['ngResource'])

  .factory 'Comment', ['$resource', ($resource) ->

    $resource('http://localhost:9292/api/v1/projects/:projectId/comments', {}
      isArray: true
      # all:
      #   method: "GET"
      #   isArray: true
      # find_by_id:
      #   method: "GET"
    )

  ]