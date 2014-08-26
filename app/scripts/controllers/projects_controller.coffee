'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ProjectsController

 # @description
 # Controller of the backloggWebApp
###
angular.module('backloggWeb')

  .controller 'ProjectsController', ['$scope', 'Project', ($scope, Project) ->

    $scope.projects = Project.query()

  ]