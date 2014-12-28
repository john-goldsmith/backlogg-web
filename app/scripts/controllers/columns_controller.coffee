"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ColumnsController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "ColumnsController", [

    "$scope",
    "$modal",
    "Project",
    "Sprint",
    "$state",
    "$project",
    "$sprint",
    "$columns",
    "$stateParams",
    "$location",
    "$routeParams",
    "$route",
    "$cookieStore",

    (
      $scope,
      $modal,
      Project,
      Sprint,
      $state,
      $project,
      $sprint,
      $columns,
      $stateParams,
      $location,
      $routeParams,
      $route,
      $cookieStore
    ) ->

      $scope.project = $project
      $scope.sprint = $sprint

      # This gets resolved and injected via the "projects" state
      $scope.columns = $columns

      # See https://github.com/angular-ui/ui-router/issues/64
      # $scope.updateQueryParam = (param, value) ->
        # $location.search param, value.toString()

      return

  ]