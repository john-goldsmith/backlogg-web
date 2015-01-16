"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:NewColumnController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "NewColumnController", ["$scope", "$modalInstance", "Column", "$state", ($scope, $modalInstance, Column, $state) ->

    $scope.task = {}

    $scope.ok = ->
      Column.create
        name: $scope.task.name
      .$promise.then (newColumn) ->
        toastr.success "Column created"
        $modalInstance.close(newColumn)
      , (failureResponse) ->
        toastr.error "Failed to create column: #{failureResponse.data.message}"

    $scope.cancel = ->
      $modalInstance.dismiss()

    # $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
    #   $scope.currentModal.dismiss() if $scope.currentModal

  ]