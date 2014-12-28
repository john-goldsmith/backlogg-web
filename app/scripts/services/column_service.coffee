'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.factory:Column

 # @description
 # Controller of the backloggWebApp
###
angular.module('columnService', ['ngResource'])

  .factory "Column", ["$resource", "apiUrl", ($resource) ->

    $resource("#{apiUrl}/sprints/:sprintId/columns",
      columnId: "@id"
    ,
      all:
        method: "GET"
        isArray: true
      # find_by_id:
      #   method: "GET"
    )

  ]