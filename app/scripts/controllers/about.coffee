'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the backloggWebApp
###
angular.module('backloggWebApp')
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
