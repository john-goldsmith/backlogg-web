'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ApplicationController

 # @description
 # Controller of the backloggWebApp
###
angular.module('backloggWeb')

  .controller 'ApplicationController', ['$scope', ($scope) ->

    $scope.APP_NAME = "Backlogg"
    $scope.activeNav = 'projects'

    $scope.isActiveNav = (navName) ->
      $scope.activeNav == navName

    $scope.setActiveNav = (navName) ->
      $scope.activeNav = navName

  ]