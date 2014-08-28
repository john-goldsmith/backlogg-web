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

    'projectServices',
    'sprintServices',
    'columnServices',
    'taskServices',
    'commentServices'
  ])