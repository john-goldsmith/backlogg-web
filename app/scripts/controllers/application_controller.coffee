'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.controller:ApplicationController

 # @description
 # Controller of the backloggWebApp
###
angular.module('backloggWeb')

  .controller 'ApplicationController', ['$scope', '$routeParams', 'Project', 'Sprint', 'Column', 'Task', 'Comment', ($scope, $routeParams, Project, Sprint, Column, Task, Comment) ->

    $scope.APP_NAME = "Backlogg"

    $scope.projects = Project.query()
    # $scope.project = Project.get projectId: $routeParams.projectId

    $scope.sprints = Sprint.query()
    # $scope.sprint = Sprint.get sprintId: $routeParams.sprintId
    # $scope.sprint = Sprint.get projectId: $routeParams.projectId

    $scope.columns = Column.query()
    # $scope.columns = Column.get columnId: $routeParams.columnId
    # $scope.columns = Column.get projectId: $routeParams.projectId

    $scope.tasks = Task.query()
    # $scope.tasks = Task.get taskId: $routeParams.taskId
    # $scope.tasks = Task.get projectId: $routeParams.projectId

    $scope.comments = Comment.query()
    # $scope.comments = Comment.get commentId: $routeParams.commentId
    # $scope.comments = Comment.get projectId: $routeParams.projectId

  ]