"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:TasksController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "TasksController", [

    "$scope",
    "$routeParams",
    "Project",
    "Sprint",
    "$state",
    "$stateParams",
    "$sprint",
    "$project",
    "$column",
    "$location",
    "$cookieStore",

    (
      $scope,
      $routeParams,
      Project,
      Sprint,
      $state,
      $stateParams,
      $sprint,
      $project,
      $column,
      $location,
      $cookieStore
    ) ->

      $scope.sprints = $sprints
      $scope.project = $project
      $scope.column = $column

      return

  ]