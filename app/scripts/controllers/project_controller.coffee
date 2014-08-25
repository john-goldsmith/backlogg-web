'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ProjectController

 # @description
 # Controller of the backloggWebApp
###
angular.module('backloggWeb')

  .controller 'ProjectController', ['$scope', '$routeParams', 'Project', ($scope, $routeParams, Project) ->

    $scope.project = Project.find_by_id projectId: $routeParams.projectId

  ]