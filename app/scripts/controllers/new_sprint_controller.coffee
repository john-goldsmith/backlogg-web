"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:NewProjectController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "NewSprintController", ["$scope", "$modalInstance", "Sprint", "$state", ($scope, $modalInstance, Sprint, $state) ->

    $scope.sprint = {}
    # $scope.currentModal = undefined

    $scope.ok = ->
      Sprint.create
        name: $scope.sprint.name
        user_id: $scope.sprint.owner
        is_active: $scope.sprint.active
      .$promise.then (newSprint) ->
        toastr.success "Sprint created"
        $modalInstance.close(newSprint)
      , (failureResponse) ->
        toastr.error "Failed to create sprint: #{failureResponse.data.message}"

    $scope.cancel = ->
      $modalInstance.dismiss()

    # $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
    #   $scope.currentModal.dismiss() if $scope.currentModal

  ]