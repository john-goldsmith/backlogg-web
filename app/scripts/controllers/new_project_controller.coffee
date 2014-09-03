"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:NewProjectController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "NewProjectController", ["$scope", "$modalInstance", "Project", ($scope, $modalInstance, Project) ->

    $scope.project = {}

    $scope.ok = ->
      Project.create
        name: $scope.project.name
        code: $scope.project.code
        user_id: $scope.project.owner
        is_active: $scope.project.active
      $modalInstance.close()

    $scope.cancel = ->
      $modalInstance.dismiss "cancel"

    return

  ]