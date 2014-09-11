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
        onEnter: ["$state", "$modal", "projects", ($state, $modal, projects) ->
          $modal.open
            templateUrl: "views/projects/new.html"
            controller: "NewProjectController"
            size: "lg"
          .result.then (newProject) ->
            projects.push(newProject)
            $state.go "projects"
          , ->
            $state.go "projects"
        ]

      .state "projects.edit",
        url: "/:projectId/edit"
        onEnter: ["$stateParams", "$state", "$modal", "Project", "projects", ($stateParams, $state, $modal, Project, projects) ->
          $modal.open
            templateUrl: "views/projects/edit.html"
            controller: "EditProjectController"
            size: "lg"
            resolve:
              project: ->
                return _.findWhere(projects, id: parseInt($stateParams.projectId))
          .result.then (updatedProject) ->
            $state.go "projects"
          , ->
            $state.go "projects"
        ]

      return

  ]