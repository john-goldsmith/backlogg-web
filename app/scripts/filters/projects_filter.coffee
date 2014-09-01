'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.filter:projectsFilter

 # @description
 # Controller of the backloggWebApp
###
angular.module('projectsFilter', [])

  .filter 'onlyActive', ->

    (showInactive) ->
      console.log showInactive