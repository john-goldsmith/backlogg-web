angular.module('backloggWeb')

  .config ['$httpProvider', '$sceDelegateProvider', '$routeProvider', ($httpProvider, $sceDelegateProvider, $routeProvider) ->

    # $httpProvider.defaults.useXDomain = true
    # $httpProvider.defaults.withCredentials = false
    # delete $httpProvider.defaults.headers.common['X-Requested-With']
    $httpProvider.defaults.headers.common["Accept"] = "application/json"
    $httpProvider.defaults.headers.common["Content-Type"] = "application/json"
    $httpProvider.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded"
    $httpProvider.defaults.headers.put["Content-Type"] = "application/x-www-form-urlencoded"
    # $sceDelegateProvider.resourceUrlWhitelist ['self', 'http://localhost:9292/*', 'http://localhost:9292/api/*', 'http://localhost:9292/api/v1/*', 'http://localhost:9292/api/v1/projects']

    $routeProvider

      .when '/projects',
        templateUrl: 'views/projects/index.html'
        # controller: 'ProjectsController'
        controller: 'ApplicationController'

      .when '/projects/:projectId',
        templateUrl: 'views/projects/show.html'
        # controller: 'ProjectController'
        controller: 'ApplicationController'

      .when '/projects/:projectId/sprints',
        templateUrl: 'views/sprints/index.html'
        # controller: 'SprintsController'
        controller: 'ApplicationController'

      .when '/projects/:projectId/columns',
        templateUrl: 'views/columns/index.html'
        # controller: 'ColumnsController'
        controller: 'ApplicationController'

      .when '/projects/:projectId/tasks',
        templateUrl: 'views/tasks/index.html'
        # controller: 'tasksController'
        controller: 'ApplicationController'

      .when '/projects/:projectId/comments',
        templateUrl: 'views/comments/index.html'
        # controller: 'commentsController'
        controller: 'ApplicationController'

      # .when '/projects/:projectId/sprints/:sprintId',
      #   templateUrl: 'views/sprints/show.html'
      #   # controller: 'SprintController'
      #   controller: 'ApplicationController'

      # .when '/projects/:projectId/sprints/:sprintId/columns',
      #   templateUrl: 'views/columns/index.html'
      #   # controller: 'ColumnsController'
      #   controller: 'ApplicationController'

      # .when '/projects/:projectId/sprints/:sprintId/columns/:columnId',
      #   templateUrl: 'views/columns/show.html'
      #   # controller: 'ColumnController'
      #   controller: 'ApplicationController'

      # .when '/projects/:projectId/sprints/:sprintId/column/:columnId/tasks',
      #   templateUrl: 'views/tasks/index.html'
      #   # controller: 'TasksController'
      #   controller: 'ApplicationController'

      # .when '/projects/:projectId/sprints/:sprintId/column/:columnId/tasks/:taskId',
      #   templateUrl: 'views/tasks/show.html'
      #   # controller: 'TaskController'
      #   controller: 'ApplicationController'

      # .when '/sprints',
      #   templateUrl: 'views//sprints/index.html'
      #   controller: 'SprintsController'

      # .when '/sprints/:sprintId',
      #   templateUrl: 'views/sprints/show.html'
      #   controller: 'SprintController'

      .otherwise
        redirectTo: '/projects'

  ]