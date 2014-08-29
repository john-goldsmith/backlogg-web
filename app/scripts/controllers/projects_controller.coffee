'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ProjectsController

 # @description
 # Controller of the backloggWebApp
###
angular.module('backloggWeb')

  .controller 'ProjectsController', ['$scope', '$modal', 'Project', '$log', ($scope, $modal, Project, $log) ->

    $scope.projects = Project.query()

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