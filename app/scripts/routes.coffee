angular.module("backloggWeb")

  .config ["$stateProvider", "$urlRouterProvider", ($stateProvider, $urlRouterProvider) ->

    $urlRouterProvider.otherwise("/projects")

    $stateProvider

      .state "projects",
        url: "/projects"
        templateUrl: "views/projects/index.html"
        controller: "ProjectsController"
        resolve:
          projects: ["Project", (Project) ->
            return Project.all().$promise
          ]

      .state "projects.new",
        url: "/new"
        controller: "ProjectsController"
        onEnter: ["$state", "$modal", ($state, $modal) ->
          $modal.open
            templateUrl: "views/projects/new.html"
            controller: "NewProjectController"
            size: "lg"
          .result.then ->
            $state.go "projects", null, reload: true
          , ->
            $state.go "projects", null, reload: true
        ]

      .state "projects.edit",
        url: "/:projectId/edit"
        controller: "ProjectsController"
        onEnter: ["$stateParams", "$state", "$modal", "Project", ($stateParams, $state, $modal, Project) ->
          $modal.open
            templateUrl: "views/projects/edit.html"
            controller: "EditProjectController"
            size: "lg"
            resolve:
              project: ->
                return Project.get(id: $stateParams.projectId).$promise
          .result.then ->
            $state.go "projects", null, reload: true
          , ->
            $state.go "projects", null, reload: true
        ]

      return

  ]