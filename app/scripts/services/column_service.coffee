"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.factory:Column

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb.services", ["ngResource"])

  .factory "Column", ["$resource", "apiUrl", ($resource, apiUrl) ->

    $resource("#{apiUrl}/columns/:columnId",
      columnId: "@id"
    ,
      all:
        method: "GET"
        isArray: true
      tasks:
        method: "GET"
        isArray: true
        url: "#{apiUrl}/columns/:columnId/tasks"
      # find_by_id:
      #   method: "GET"
    )

  ]