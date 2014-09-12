angular.module("backloggWeb")

  .config ["$stateProvider", "$urlRouterProvider", ($stateProvider, $urlRouterProvider) ->

    $urlRouterProvider.otherwise("/projects")

    $stateProvider

      ############
      # Projects #
      ############
      .state "projects",
        url: "/projects?archived&view&sort"
        templateUrl: "views/projects/index.html"
        controller: "ProjectsController"
        # reloadOnSearch: false
        resolve:
          $projects: ["Project", (Project) ->
            Project.all().$promise
          ]

      .state "projects.new",
        url: "/new"
        onEnter: ["$state", "$modal", "$projects", ($state, $modal, $projects) ->
          $modal.open
            templateUrl: "views/projects/new.html"
            controller: "NewProjectController"
            size: "lg"
          .result.then (newProject) ->
            $projects.push(newProject)
            $state.go "projects"
          , ->
            $state.go "projects"
        ]

      .state "projects.edit",
        url: "/:projectId/edit"
        onEnter: ["$stateParams", "$state", "$modal", "Project", "$projects", ($stateParams, $state, $modal, Project, $projects) ->
          $modal.open
            templateUrl: "views/projects/edit.html"
            controller: "EditProjectController"
            size: "lg"
            resolve:
              $project: ->
                _.findWhere($projects, id: parseInt($stateParams.projectId))
          .result.then (updatedProject) ->
            $state.go "projects"
          , ->
            $state.go "projects"
        ]

      ###########
      # Sprints #
      ###########
      .state "sprints",
        url: "/projects/:projectId/sprints"
        templateUrl: "views/sprints/index.html"
        controller: "SprintsController"
        # resolve:
        #   $project: ["Project", (Project) ->
        #     Project.get(projectId: $stateParams.projectId).$promise
        #   ]

      .state "sprints.new",
        url: "/new"
        # onEnter: ["$state", "$modal", "projects", ($state, $modal, projects) ->
        #   $modal.open
        #     templateUrl: "views/projects/new.html"
        #     controller: "NewProjectController"
        #     size: "lg"
        #   .result.then (newProject) ->
        #     projects.push(newProject)
        #     $state.go "projects"
        #   , ->
        #     $state.go "projects"
        # ]

      .state "sprints.edit",
        url: "/:sprintId/edit"
        # onEnter: ["$stateParams", "$state", "$modal", "Project", "projects", ($stateParams, $state, $modal, Project, projects) ->
        #   $modal.open
        #     templateUrl: "views/projects/edit.html"
        #     controller: "EditProjectController"
        #     size: "lg"
        #     resolve:
        #       project: ->
        #         _.findWhere(projects, id: parseInt($stateParams.projectId))
        #   .result.then (updatedProject) ->
        #     $state.go "projects"
        #   , ->
        #     $state.go "projects"
        # ]

      return

  ]