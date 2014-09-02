"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ProjectsController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "ProjectsController", ["$scope", "$rootScope", "$modal", "Project", "$log", ($scope, $rootScope, $modal, Project, $log) ->

    $scope.includeInactive = false
    $scope.projects = Project.all()

    $scope.showInactive = (project) ->
      if $scope.includeInactive
        project.project.is_active or !project.project.is_active
      else
        project.project.is_active

    $scope.new = (size = "lg") ->
      modalInstance = $modal.open
        templateUrl: "views/projects/new.html"
        controller: "NewProjectController"
        size: size

      modalInstance.result.then ( ->
        $scope.projects = Project.all()
      ), ->
        $log.info "Modal dismissed at: " + new Date()

    $scope.edit = (project, size = "lg") ->
      modalInstance = $modal.open
        templateUrl: "views/projects/edit.html"
        controller: "EditProjectController"
        size: size
        resolve:
          project: ->
            return project;

      modalInstance.result.then ( ->
        $scope.projects = Project.all()
      ), ->
        $log.info "Modal dismissed at: " + new Date()

    return

  ]