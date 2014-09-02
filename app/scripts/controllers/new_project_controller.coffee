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
    $scope.project.name ||= "New Project"

    $scope.ok = ->
      Project.create
        name: $scope.project.name
        code: $scope.project.code
        # slug: $scope.project.slug
        is_active: $scope.project.active
        user_id: $scope.project.owner
      $modalInstance.close()
      return

    $scope.cancel = ->
      $modalInstance.dismiss "cancel"

    return

  ]