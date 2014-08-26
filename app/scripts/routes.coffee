angular.module('backloggWeb')

  .config ['$routeProvider', ($routeProvider) ->

    $routeProvider

      .when '/projects',
        templateUrl: 'views/projects/index.html'
        controller: 'ProjectsController'
      .when '/projects/:projectId',
        templateUrl: 'views/projects/show.html'
        controller: 'ProjectsController'

      .when '/sprints',
        templateUrl: 'views//sprints/index.html'
        controller: 'SprintsController'
      .when '/sprints/:sprintId',
        templateUrl: 'views/sprints/show.html'
        controller: 'SprintController'

      .otherwise
        redirectTo: '/projects'

  ]