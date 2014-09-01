"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ProjectsController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "ProjectsController", ["$scope", "$rootScope", "$modal", "Project", "$log", ($scope, $rootScope, $modal, Project, $log) ->

    # console.log $scope
    # console.log $rootScope

    $scope.includeInactive = false
    $scope.projects = Project.all()

    $scope.showInactive = (project) ->
      if $scope.includeInactive
        project.project.is_active or !project.project.is_active
      else
        project.project.is_active

    $scope.open = (size = "lg") ->
      console.log "$scope.open"
      modalInstance = $modal.open(
        templateUrl: "views/projects/new.html"
        controller: "ModalInstanceController"
        size: size
        # resolve:
        #   projects: ->
        #     return $scope.projects;
      )

      modalInstance.result.then ( ->
        console.log "result.then"
        $scope.projects = Project.all()
      ), ->
        $log.info "Modal dismissed at: " + new Date()

    return

  ]