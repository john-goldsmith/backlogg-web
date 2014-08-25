'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.factory:Project

 # @description
 # Controller of the backloggWebApp
###
angular.module('projectServices')

  .factory 'Projects', ['$resource', ($resource) ->

    $resource('http://localhost:9292/api/v1/projects', {}
      all:
        method: "GET"
        isArray: true
    )

  ]