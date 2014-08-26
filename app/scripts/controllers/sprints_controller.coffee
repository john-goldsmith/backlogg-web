'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.controller:SprintsController

 # @description
 # Controller of the backloggWebApp
###
angular.module('backloggWeb')

  .controller 'SprintsController', ['$scope', 'Sprint', ($scope, Sprint) ->

    $scope.sprints = Sprint.query()

  ]