"use strict"

###*
 # @ngdoc function
 # @name backloggWebApp.controller:NewProjectController

 # @description
 # Controller of the backloggWebApp
###
angular.module("backloggWeb")

  .controller "NewProjectController", ["$scope", "$modalInstance", "Project", "Restangular", "projects", ($scope, $modalInstance, Project, Restangular, projects) ->

    $scope.project = {}

    $scope.ok = ->
      projects.post($scope.project).then ->
        $modalInstance.close()

    $scope.cancel = ->
      $modalInstance.dismiss "cancel"

    return

  ]