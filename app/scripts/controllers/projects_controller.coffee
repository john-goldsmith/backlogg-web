'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ProjectsController

 # @description
 # Controller of the backloggWebApp
###
angular.module('backloggWeb')

  .controller 'ProjectsController', ['$scope', '$modal', 'Project', '$log', ($scope, $modal, Project, $log) ->

    $scope.showInactive = false
    $scope.projects = Project.query()
    # $scope.proxjects = if $scope.showInactive then Project.query() else _.filter(Project.query(), (project) -> project.is_active
    # $scope.projects = _.filter([$scope.projects], (item) ->
    #   console.log item.project
    #   # return item.project.is_active
    # )

    $scope.open = (size = "lg") ->
      modalInstance = $modal.open(
        templateUrl: 'views/projects/new.html'
        controller: 'ModalInstanceController'
        size: size
        resolve:
          projects: ->
            return $scope.projects;
      )

      modalInstance.result.then ((selectedItem) ->
        $scope.selected = selectedItem
      ), ->
        $log.info 'Modal dismissed at: ' + new Date()

    return

  ]