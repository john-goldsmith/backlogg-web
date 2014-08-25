angular
  .module('backloggWeb')
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/projects',
        templateUrl: 'views/projects/index.html'
        controller: 'ProjectsController'
      .when '/projects/:projectId',
        templateUrl: 'views/projects/show.html'
        controller: 'ProjectsController'
      .otherwise
        redirectTo: '/projects'
  ]