"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:EditProjectController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "EditProjectController", ["$scope", "$modalInstance", "project", "Project", ($scope, $modalInstance, project, Project) ->

    $scope.project = project

    $scope.ok = ->
      Project.update
        id: $scope.project.project.id
        name: $scope.project.project.name
        code: $scope.project.project.code
        user_id: $scope.project.project.user.id
        is_active: $scope.project.project.is_active
      $modalInstance.close()
      return

    $scope.cancel = ->
      $modalInstance.dismiss "cancel"

    return

  ]