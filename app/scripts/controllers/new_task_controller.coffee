"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:NewProjectController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "NewTaskController", ["$scope", "$modalInstance", "Task", "$state", ($scope, $modalInstance, Project, $state) ->

    $scope.task = {}

    $scope.ok = ->
      Task.create
        name: $scope.task.name
        is_active: $scope.task.active
      .$promise.then (newTask) ->
        toastr.success "Task created"
        $modalInstance.close(newTask)
      , (failureResponse) ->
        toastr.error "Failed to create task: #{failureResponse.data.message}"

    $scope.cancel = ->
      $modalInstance.dismiss()

    # $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
    #   $scope.currentModal.dismiss() if $scope.currentModal

  ]