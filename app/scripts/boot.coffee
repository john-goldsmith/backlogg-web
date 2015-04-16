"use strict"

###*
 # @ngdoc overview
 # @name backloggWebApp
 #
 # @description
 # Main module of the application.
###
angular.module("backloggWeb", [
    "ngAnimate",
    "ngCookies",
    "ngResource",
    "ngRoute",
    "ngSanitize",
    "ngTouch",

    "ui.bootstrap",
    "ui.router",
    # "angular-underscore",
    # "restangular",

    "projectService",
    "sprintService",
    "columnService",
    "taskService",
    "commentService",

    "projectsFilter"
  ])