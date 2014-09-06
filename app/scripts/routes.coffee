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
        # resolve:
        #   projects: null
        # controller: ["$scope", "Project", "projects" ($scope, Project, projects) ->
        #   console.log 'projects'
        #   projects = $scope.projects = Project.all()
        # ]
        # data:
        #   projects: $scope.projects

      .state "projects.new",
        url: "/new"
        controller: "ProjectsController"
        # controller: ["$scope", ($scope) ->
        #   console.log 'jalksdjflkasdf'
        #   console.log $scope
        # ]
        onEnter: ["$stateParams", "$state", "$modal", "Project", ($stateParams, $state, $modal, Project) ->
          $modal.open
            templateUrl: "views/projects/new.html"
            controller: "NewProjectController"
            size: "lg"
            resolve:
              newPath: ->
                return "projects.new"
          .result.then ->
            # $scope.projects = Project.all()
            $state.go "projects", null, reload: true
          , ->
            $state.go "projects", null, reload: true
        ]

      .state "projects.edit",
        url: "/:projectId/edit"
        # controller: "ProjectsController"
        onEnter: ["$stateParams", "$state", "$modal", "Project", ($stateParams, $state, $modal, Project) ->
          $modal.open
            templateUrl: "views/projects/edit.html"
            controller: "EditProjectController"
            size: "lg"
            resolve:
              project: ->
                return Project.get id: $stateParams.projectId
              newPath: ->
                return "projects.edit"
          .result.then ->
            $state.go "projects"
          , ->
            $state.go "projects"
        ]

      return

  ]