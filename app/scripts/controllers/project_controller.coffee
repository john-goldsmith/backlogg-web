'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ProjectController

 # @description
 # Controller of the backloggWebApp
###
angular.module('backloggWeb')

  .controller 'ProjectController', ['$scope', '$routeParams', 'Project', ($scope, $routeParams, Project) ->

    $scope.project = Project.get projectId: $routeParams.projectId

  ]