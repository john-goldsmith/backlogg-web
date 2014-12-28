"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.factory:Project

 # @description
 # Controller of the backloggWebApp
###
angular.module("projectService", ["ngResource"])

  .factory "Project", ["$resource", "apiUrl", ($resource, apiUrl) ->

    $resource("#{apiUrl}/projects/:projectId",
      projectId: "@id"
    ,
      all:
        method: "GET"
        isArray: true
        params:
          include_inactive: true

      # active:
      #   method: "GET"
      #   isArray: true
      #   params:
      #     include_inactive: false

      # inactive:
      #   method: "GET"
      #   isArray: true

      create:
        method: "POST"
        isArray: false

      update:
        method: "PUT"
        isArray: false

      archive:
        method: "PUT"
        isArray: false
        url: "#{apiUrl}/projects/:projectId/archive"

      unarchive:
        method: "PUT"
        isArray: false
        url: "#{apiUrl}/projects/:projectId/unarchive"

      sprints:
        method: "GET"
        isArray: true
        url: "#{apiUrl}/projects/:projectId/sprints"

    )

  ]