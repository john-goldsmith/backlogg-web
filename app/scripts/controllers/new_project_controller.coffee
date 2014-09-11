"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:NewProjectController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "NewProjectController", ["$scope", "$modalInstance", "Project", "$state", ($scope, $modalInstance, Project, $state) ->

    $scope.project = {}
    # $scope.currentModal = undefined

    $scope.ok = ->
      Project.create
        name: $scope.project.name
        code: $scope.project.code
        user_id: $scope.project.owner
        is_active: $scope.project.active
      .$promise.then (newProject) ->
        toastr.success "Project created"
        $modalInstance.close(newProject)
      , (failureResponse) ->
        toastr.error "Failed to create project: #{failureResponse.data.message}"

    $scope.cancel = ->
      $modalInstance.dismiss()

    # $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
    #   $scope.currentModal.dismiss() if $scope.currentModal

  ]