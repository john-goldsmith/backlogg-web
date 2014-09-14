"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ProjectsController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "ProjectsController", [

    "$scope",
    "$modal",
    "Project",
    "$state",
    "$projects",
    "$stateParams",
    "$location",
    "$routeParams",
    "$route",
    "$cookieStore",

    (
      $scope,
      $modal,
      Project,
      $state,
      $projects,
      $stateParams,
      $location,
      $routeParams,
      $route,
      $cookieStore
    ) ->

      # $location.search("archived", "false") if $location.search().archived is undefined
      # $location.search("sort", "updated_at") if $location.search().sort is undefined
      # $location.search("view", "boards") if $location.search().view is undefined

      $scope.includeInactive = $location.search().archived is "true" || $location.search().archived is true
      $scope.view = $location.search().view
      $scope.orderAttribute = $location.search().sort

      $cookieStore.put "projects.archived", $scope.includeInactive
      $cookieStore.put "projects.view", $scope.view
      $cookieStore.put "projects.sort", $scope.orderAttribute

      $scope.$on "$locationChangeSuccess", ->
        $scope.includeInactive = $location.search().archived is "true" || $location.search().archived is true
        $scope.view = $location.search().view
        $scope.orderAttribute = $location.search().sort

      # See https://github.com/angular-ui/ui-router/issues/64
      $scope.updateQueryParam = (param, value) ->
        $location.search param, value.toString()

      $scope.isActiveView = (view) ->
        $scope.view == view

      # This gets resolved and injected via the "projects" state
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
      # $scope.sortBy $location.search().sort
      $scope.sortBy $scope.orderAttribute

      return

  ]