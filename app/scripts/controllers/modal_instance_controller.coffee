"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ModalInstanceController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "ModalInstanceController", ["$scope", "$rootScope", "$modalInstance", "Project", ($scope, $rootScope, $modalInstance, Project) ->

    $scope.project = {}
    console.log $rootScope

    $scope.ok = ->
      console.log "$scope.ok"
      Project.create
        name: $scope.project.name
        code: $scope.project.code
        slug: $scope.project.slug
        is_active: $scope.project.active
        user_id: $scope.project.owner
      $modalInstance.close()
      return

    $scope.cancel = ->
      console.log "$scope.cancel"
      $modalInstance.dismiss "cancel"

    return

  ]