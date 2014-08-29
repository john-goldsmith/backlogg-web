'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ModalInstanceController

 # @description
 # Controller of the backloggWebApp
###
angular.module('backloggWeb')

  .controller 'ModalInstanceController', ['$scope', '$modalInstance', 'projects', ($scope, $modalInstance, projects) ->

    $scope.projects = projects

    $scope.selected =
      project: $scope.projects[0]

    $scope.ok = ->
      $modalInstance.close $scope.selected.project

    $scope.cancel = ->
      $modalInstance.dismiss 'cancel'

    return

  ]