"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ProjectActionsController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "ProjectActionsController", ["$scope", ($scope) ->

    $scope.items = [
      'The first choice!',
      'And another choice for you.',
      'but wait! A third!'
    ]

    $scope.status =
      isopen: false

    $scope.toggled = (open) ->
      console.log 'Dropdown is now: ', open

    $scope.toggleDropdown = ($event) ->
      $event.preventDefault()
      $event.stopPropagation()
      $scope.status.isopen = !$scope.status.isopen

    return

  ]