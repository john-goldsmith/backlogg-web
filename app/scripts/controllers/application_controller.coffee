"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ApplicationController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "ApplicationController", [

    "$scope",

    (
      $scope
    ) ->

      angular.element(document).bind "keyup", (event) ->
        angular.element("#search").focus() if event.which is 191

      return

  ]