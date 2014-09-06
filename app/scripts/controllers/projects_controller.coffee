"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ProjectsController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "ProjectsController", ["$scope", "$rootScope", "$modal", "Project", "$log", "$state", ($scope, $rootScope, $modal, Project, $log, $state) ->

    $scope.includeInactive = false
    # $scope.projects = Project.all()
    $scope.sort = "project.name"

    console.log $state.current.data

    $scope.sortBy = (item) ->
      $scope.sort = "project.#{item}"

    $scope.showInactive = (project) ->
      # if $scope.includeInactive
        # project.project.is_active or !project.project.is_active
      # else
        # project.project.is_active
      $scope.includeInactive || project.project.is_active

    $scope.new = ->
      $state.go "projects.new"

    $scope.edit = (project) ->
      $state.go "projects.edit", projectId: project.id
      # editProjectModalInstance = $modal.open
      #   templateUrl: "views/projects/edit.html"
      #   controller: "EditProjectController"
      #   size: size
      #   resolve:
      #     project: ->
      #       return project
      #     newPath: ->
      #       return "projects.edit"

      # editProjectModalInstance.result.then ->
      #   $state.go "projects"
      # , ->
      #   $state.go "projects"
      #   $log.info "Modal dismissed at: " + new Date()

    return

  ]