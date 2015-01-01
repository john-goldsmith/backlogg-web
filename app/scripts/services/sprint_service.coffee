"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.factory:Sprint

 # @description
 # Controller of the backloggWebApp
###
angular.module("sprintService", ["ngResource"])

  .factory "Sprint", ["$resource", "Config", "apiUrl", ($resource, Config, apiUrl) ->

    $resource("#{apiUrl}/sprints/:sprintId",
      sprintId: "@id"
    ,
      all:
        method: "GET"
        isArray: true
      create:
        method: "POST"
        isArray: false
      columns:
        method: "GET"
        isArray: true
        url: "#{apiUrl}/sprints/:sprintId/columns"
    )

  ]