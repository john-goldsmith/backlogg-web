"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:NewProjectController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "NewProjectController", ["$scope", "$modalInstance", "Project", "$state", "newPath", ($scope, $modalInstance, Project, $state, newPath) ->

    $scope.project = {}

    $modalInstance.opened.then ->
      $state.go(newPath)

    $scope.ok = ->
      Project.create
        name: $scope.project.name
        code: $scope.project.code
        user_id: $scope.project.owner
        is_active: $scope.project.active
      $modalInstance.close()

    $scope.cancel = ->
      $modalInstance.dismiss "cancel"

    # $scope.$on "$stateChangeSuccess", ->
    #   console.log 'jalksjldkfd'
    #   $modalInstance.dismiss "cancel" if $state.current.name != newPath

    return

  ]