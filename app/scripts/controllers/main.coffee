'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.controller:MainCtrl

 # @description
 # MainCtrl
 # Controller of the backloggWebApp
###
angular.module('backloggWeb')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
