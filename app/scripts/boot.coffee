"use strict"

###*
 # @ngdoc overview
 # @name backloggWeb
 #
 # @description
 # Main module of the application.
###
angular.module "backloggWeb.controllers", []
angular.module "backloggWeb.directives", []
angular.module "backloggWeb.filters", []
angular.module "backloggWeb.providers", []
angular.module "backloggWeb.services", []
angular.module "backloggWeb", [
  "ngAnimate"
  "ngCookies"
  "ngResource"
  "ngRoute"
  "ngSanitize"
  "ngTouch"

  "ui.bootstrap"
  "ui.router"
  # "angular-underscore"
  # "restangular"

  "backloggWeb.controllers"
  "backloggWeb.directives"
  "backloggWeb.filters"
  "backloggWeb.providers"
  "backloggWeb.services"
]