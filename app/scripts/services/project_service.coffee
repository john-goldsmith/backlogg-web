"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.factory:Project

 # @description
 # Controller of the backloggWebApp
###
angular.module("projectServices", ["ngResource"])

  .factory "Project", ["$resource", ($resource) ->

    $resource("http://localhost:9292/api/v1/projects/:id",
      id: "@id"
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
        url: "http://localhost:9292/api/v1/projects/:id/archive"

      unarchive:
        method: "PUT"
        isArray: false
        url: "http://localhost:9292/api/v1/projects/:id/unarchive"

    )

  ]