"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:NewSprintController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "NewSprintController", ["$scope", "$modalInstance", "Sprint", "$state", "$project", ($scope, $modalInstance, Sprint, $state, $project) ->

    # $scope.currentModal = undefined

    #########
    # Modal #
    #########
    $scope.sprint = {}

    $scope.ok = ->
      Sprint.create
        name: $scope.sprint.name
        project_id: $project.id
        starts_at: $scope.createTimestamp($scope.sprint.startDate.date, $scope.sprint.startTime)
        ends_at: $scope.createTimestamp($scope.sprint.endDate.date, $scope.sprint.endTime)
        is_active: $scope.sprint.active
      .$promise.then (newSprint) ->
        toastr.success "Sprint created"
        $modalInstance.close(newSprint)
      , (failureResponse) ->
        toastr.error "Failed to create sprint: #{failureResponse.data.message}"

    $scope.cancel = ->
      $modalInstance.dismiss()

    ###############
    # Datepickers #
    ###############
    $scope.sprint.startDate = {}

    $scope.sprint.startDate.today = ->
      $scope.sprint.startDate.date = new Date()
    $scope.sprint.startDate.today()

    $scope.sprint.startDate.clear = ->
      $scope.sprint.startDate.date = null

    $scope.sprint.startDate.open = ($event) ->
      $event.preventDefault()
      $event.stopPropagation()
      $scope.sprint.startDate.opened = true

    $scope.sprint.endDate = {}

    $scope.sprint.endDate.today = ->
      $scope.sprint.endDate.date = new Date()
    $scope.sprint.endDate.today()

    $scope.sprint.endDate.clear = ->
      $scope.sprint.endDate.date = null

    $scope.sprint.endDate.open = ($event) ->
      $event.preventDefault()
      $event.stopPropagation()
      $scope.sprint.endDate.opened = true

    ###############
    # Timepickers #
    ###############
    $scope.sprint.startTime = new Date()
    $scope.sprint.startTime.setMinutes 0
    $scope.sprint.endTime = new Date()
    $scope.sprint.endTime.setMinutes 0

    $scope.createTimestamp = (date, time) ->
      if date instanceof Date and time instanceof Date
        str = (date.getMonth() + 1) + "/" + date.getDate() + "/" + date.getFullYear() + " " + time.getHours() + ":" + time.getMinutes()
        new Date(str)

    # $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
    #   $scope.currentModal.dismiss() if $scope.currentModal

  ]