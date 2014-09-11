"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:SprintsController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "SprintsController", ["$scope", "$routeParams", "Project", "Sprint", "$state", "$stateParams", ($scope, $routeParams, Project, Sprint, $state, $stateParams) ->

    $scope.sprints = Sprint.all(projectId: $stateParams.projectId)

    return

  ]