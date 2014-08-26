'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.controller:SprintController

 # @description
 # Controller of the backloggWebApp
###
angular.module('backloggWeb')

  .controller 'SprintController', ['$scope', '$routeParams', 'Sprint', ($scope, $routeParams, Sprint) ->

    $scope.sprint = Sprint.get sprintId: $routeParams.sprintId

  ]