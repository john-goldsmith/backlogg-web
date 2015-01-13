"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.factory:Task

 # @description
 # Controller of the backloggWebApp
###
angular.module("taskService", ["ngResource"])

  .factory "Task", ["$resource", "apiUrl", ($resource, apiUrl) ->

    $resource("#{apiUrl}/tasks/:taskId", {}
      isArray: true
      # all:
      #   method: "GET"
      #   isArray: true
      # find_by_id:
      #   method: "GET"
    )

  ]