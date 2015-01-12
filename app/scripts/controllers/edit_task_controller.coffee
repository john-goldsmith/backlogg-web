"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:TasksController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "EditTaskController", [

    "$scope",
    "$modalInstance",
    "$routeParams",
    "Task",
    "$state",
    "$stateParams",
    "$sprint",
    "$project",
    "$column",
    "$location",
    "$cookieStore",

    (
      $scope,
      $modalInstance,
      $routeParams,
      Task,
      $state,
      $stateParams,
      $sprint,
      $project,
      $column,
      $location,
      $cookieStore
    ) ->

      $scope.sprints = $sprints
      $scope.project = $project
      $scope.column = $column
      $scope.task = $task

      $scope.ok = ->
        Task.update
          id: $task.id
          name: $scope.task.name
          column_id: $scope.task.user.id
          is_active: $scope.task.is_active
        .$promise.then (updatedTask) ->
          toastr.success "Task updated"
          $modalInstance.close(updatedTask)
        , (failureResponse) ->
          toastr.error "Failed to update task: #{failureResponse.data.message}"

      $scope.cancel = ->
        $modalInstance.dismiss()

      # $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
      #   $scope.currentModal.dismiss() if $scope.currentModal

      return

  ]