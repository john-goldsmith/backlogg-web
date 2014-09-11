"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:EditProjectController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "EditProjectController", ["$scope", "$modalInstance", "Project", "$state", "project", ($scope, $modalInstance, Project, $state, project) ->

    $scope.project = project
    # $scope.currentModal = undefined

    $scope.ok = ->
      # TODO: Simplify the following update request. The API doesn't
      # understand the entire project.user object -- it only cares about
      # user_id. The following would be preferable:
      #
      # Project.update(id: project.id, project)
      Project.update
        id: project.id
        name: $scope.project.name
        code: $scope.project.code
        user_id: $scope.project.user.id
        is_active: $scope.project.is_active
      .$promise.then (updatedProject) ->
        toastr.success "Project updated"
        $modalInstance.close(updatedProject)
      , (failureResponse) ->
        toastr.error "Failed to update project: #{failureResponse.data.message}"

    $scope.cancel = ->
      $modalInstance.dismiss()

    # $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
    #   $scope.currentModal.dismiss() if $scope.currentModal

  ]