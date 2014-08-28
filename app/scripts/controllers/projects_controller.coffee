'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ProjectsController

 # @description
 # Controller of the backloggWebApp
###
angular.module('backloggWeb')

  .controller 'ProjectsController', ['$rootScope', '$scope', 'Project', ($rootScope, $scope, Project) ->

    $scope.projects = Project.query()
    console.log $rootScope
    console.log $scope

  ]