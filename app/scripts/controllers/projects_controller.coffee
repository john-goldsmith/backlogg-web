"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ProjectsController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "ProjectsController", ["$scope", "$modal", "Project", "$state", "projects", ($scope, $modal, Project, $state, projects) ->

    $scope.includeInactive = false
    $scope.projects = projects
    $scope.sortMapping =
      created_at: "creation"
      updated_at: "modification"
      name: "name"
      code: "code"

    $scope.sortBy = (sortAttribute) ->
      $scope.orderAttribute = sortAttribute
      $scope.sortLabel = $scope.sortMapping[sortAttribute]

    $scope.showInactive = (project) ->
      $scope.includeInactive || project.is_active

    $scope.new = ->
      $state.go "projects.new"

    $scope.edit = (project) ->
      $state.go "projects.edit", projectId: project.id

    $scope.sortBy "name"

    return

  ]