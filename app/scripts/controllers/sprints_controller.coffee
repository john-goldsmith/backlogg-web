'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.controller:SprintsController

 # @description
 # Controller of the backloggWebApp
###
angular.module('backloggWeb')

  .controller 'SprintsController', ['$scope', '$routeParams', 'Project', 'Sprint', ($scope, $routeParams, Project, Sprint) ->

    $scope.project = Project.get projectId: $routeParams.projectId

    $scope.sprints = Sprint.query projectId: $routeParams.projectId

  ]