'use strict'

###*
 # @ngdoc function
 # @name backloggWebApp.filter:projectsFilter

 # @description
 # Controller of the backloggWebApp
###
# angular.module('backloggWeb')
angular.module('projectsFilter', [])
  .filter('onlyActive', ->
    console.log 'aaaa'
    return (project) ->
      console.log 'bbbbb'
      # return project.is_active
      console.log project.$resolved
  )