"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:NewProjectController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "NewProjectController", ["$scope", "$modalInstance", "Project", "$state", ($scope, $modalInstance, Project, $state, newPath) ->

    $scope.project = {}
    $scope.currentModal = undefined

    $scope.ok = ->
      Project.create
        name: $scope.project.name
        code: $scope.project.code
        user_id: $scope.project.owner
        is_active: $scope.project.active
      $modalInstance.close()

    $scope.cancel = ->
      $modalInstance.dismiss()

    $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
      $scope.currentModal.dismiss() if $scope.currentModal

  ]