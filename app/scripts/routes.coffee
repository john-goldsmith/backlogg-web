angular.module('backloggWeb')

  .config ['$routeProvider', '$stateProvider', '$urlRouterProvider', ($routeProvider, $stateProvider, $urlRouterProvider) ->

    # $routeProvider

    #   .when '/projects',
    #     templateUrl: 'views/projects/index.html'
    #     # controller: 'ProjectsController'
    #     controller: 'ApplicationController'

    #   .when '/projects/:projectId/edit',
    #     templateUrl: 'views/projects/index.html'
    #     # controller: 'ProjectController'
    #     controller: 'ApplicationController'

    #   .when '/projects/:projectId/sprints',
    #     templateUrl: 'views/sprints/index.html'
    #     # controller: 'SprintsController'
    #     controller: 'ApplicationController'

    #   .when '/projects/:projectId/columns',
    #     templateUrl: 'views/columns/index.html'
    #     # controller: 'ColumnsController'
    #     controller: 'ApplicationController'

    #   .when '/projects/:projectId/tasks',
    #     templateUrl: 'views/tasks/index.html'
    #     # controller: 'tasksController'
    #     controller: 'ApplicationController'

    #   .when '/projects/:projectId/comments',
    #     templateUrl: 'views/comments/index.html'
    #     # controller: 'commentsController'
    #     controller: 'ApplicationController'

    #   .otherwise
    #     redirectTo: '/projects'

    $urlRouterProvider.otherwise("/projects")

    $stateProvider

      .state "projects",
        url: "/projects"
        templateUrl: "views/projects/index.html"
        controller: "ProjectsController"

      .state "projects.edit",
        url: "/:projectId/edit"
        controller: "ProjectsController"

      .state "projects.new",
        url: "/new"
        controller: "ProjectsController"

      return

  ]