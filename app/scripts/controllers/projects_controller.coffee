"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ProjectsController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "ProjectsController", ["$scope", "$modal", "Project", "$state", "$projects", "$stateParams", "$location", "$routeParams", "$route", ($scope, $modal, Project, $state, $projects, $stateParams, $location, $routeParams, $route) ->

    # $scope.includeInactive = $stateParams.archived is 'true'
    $scope.includeInactive = $location.search('archived') #is 'true'

    # $scope.view = $stateParams.view || "boards"
    # $scope.view = $location.search('view') || "boards"

    # $scope.orderAttribute = $stateParams.sort || "updated_at"
    # $scope.orderAttribute = $location.search('sort') || "updated_at"

    console.log $stateParams
    console.log $routeParams
    console.log $route.routes
    console.log $route.current.routes
    console.log $route.current

    # See https://github.com/angular-ui/ui-router/issues/64
    $scope.updateQueryParam = (key, value) ->
      $location.search(key, value)

    # This gets resolved and injected via the 'projects' state
    $scope.projects = $projects

    # Create a mapping of sort values to their label
    $scope.sortMapping =
      created_at: "creation"
      updated_at: "modification"
      name: "name"
      code: "code"

    $scope.viewAs = (view) ->
      $scope.view = view

    $scope.sortBy = (sortAttribute) ->
      $scope.orderAttribute = sortAttribute
      $scope.sortLabel = $scope.sortMapping[sortAttribute]

    $scope.showInactive = (project) ->
      $scope.includeInactive || project.is_active

    $scope.new = ->
      $state.go "projects.new"

    $scope.edit = (project) ->
      $state.go "projects.edit", projectId: project.id

    $scope.archive = (project) ->
      project.$archive (successResponse) ->
        toastr.success "Project archived"
        $state.go "projects"
      , (failureResponse) ->
        toastr.error "Failed to archive project: #{failureResponse.data.message}"

    $scope.unarchive = (project) ->
      project.$unarchive (successResponse) ->
        toastr.success "Project unarchived"
        $state.go "projects"
      , (failureResponse) ->
        toastr.error "Failed to unarchive project: #{failureResponse.data.message}"

    # Initial sort
    # $scope.sortBy "name"

    return

  ]