"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.factory:Comment

 # @description
 # Controller of the backloggWebApp
###
angular.module("commentService", ["ngResource"])

  .factory "Comment", ["$resource", "apiUrl", ($resource, apiUrl) ->

    $resource("#{apiUrl}/projects/:projectId/comments", {}
      isArray: true
      # all:
      #   method: "GET"
      #   isArray: true
      # find_by_id:
      #   method: "GET"
    )

  ]