"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:SprintsController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "SprintsController", [

    "$scope",
    "$routeParams",
    "Project",
    "Sprint",
    "$state",
    "$stateParams",
    "$sprints",
    "$project",
    "$location",
    "$cookieStore",

    (
      $scope,
      $routeParams,
      Project,
      Sprint,
      $state,
      $stateParams,
      $sprints,
      $project,
      $location,
      $cookieStore
    ) ->

      $scope.sprints = $sprints
      $scope.project = $project

      $location.search("archived", "false") if $location.search().archived is undefined
      $location.search("sort", "updated_at") if $location.search().sort is undefined
      $location.search("view", "boards") if $location.search().view is undefined

      $scope.includeInactive = $location.search().archived is "true" || $location.search().archived is true
      $scope.view = $location.search().view
      $scope.orderAttribute = $location.search().sort

      $cookieStore.put "sprints.archived", $scope.includeInactive
      $cookieStore.put "sprints.view", $scope.view
      $cookieStore.put "sprints.sort", $scope.orderAttribute

      $scope.$on "$locationChangeSuccess", ->
        $scope.includeInactive = $location.search().archived is "true" || $location.search().archived is true
        $scope.view = $location.search().view
        $scope.orderAttribute = $location.search().sort

      # See https://github.com/angular-ui/ui-router/issues/64
      $scope.updateQueryParam = (param, value) ->
        $location.search param, value.toString()

      $scope.isActiveView = (view) ->
        $scope.view == view

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

      $scope.showInactive = (sprint) ->
        $scope.includeInactive || sprint.is_active

      # $scope.new = ->
      #   $state.go "sprints.new"

      # $scope.edit = (sprint) ->
      #   $state.go "sprints.edit", sprintId: sprint.id

      $scope.archive = (sprint) ->
        sprint.$archive (successResponse) ->
          toastr.success "Sprint archived"
          $state.go "sprints"
        , (failureResponse) ->
          toastr.error "Failed to archive sprint: #{failureResponse.data.message}"

      $scope.unarchive = (sprint) ->
        sprint.$unarchive (successResponse) ->
          toastr.success "Sprint unarchived"
          $state.go "sprints"
        , (failureResponse) ->
          toastr.error "Failed to unarchive sprint: #{failureResponse.data.message}"

      # Initial sort
      # $scope.sortBy $location.search().sort
      $scope.sortBy $scope.orderAttribute

      return

  ]