"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.factory:Sprint

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb.services", ["ngResource"])

  .factory "Sprint", ["$resource", "CONFIG", "apiUrl", ($resource, CONFIG, apiUrl) ->

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