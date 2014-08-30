'use strict'

###*
 # @ngdoc overview
 # @name backloggWebApp
 #
 # @description
 # Main module of the application.
###
angular.module('backloggWeb', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',

    'ui.bootstrap',
    'angular-underscore',

    'projectServices',
    'sprintServices',
    'columnServices',
    'taskServices',
    'commentServices',

    'projectsFilter'
  ])