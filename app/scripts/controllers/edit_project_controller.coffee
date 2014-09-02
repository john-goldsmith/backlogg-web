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
      $scope.project.$update()
        # id: $scope.project.id
        # name: $scope.project.name
        # code: $scope.project.code
        # slug: $scope.project.slug
        # is_active: $scope.project.active
        # user_id: $scope.project.owner
      # $scope.project.$save()
      $modalInstance.close()
      return

    $scope.cancel = ->
      $modalInstance.dismiss "cancel"

    return

  ]