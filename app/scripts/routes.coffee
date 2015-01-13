angular.module("backloggWeb")

  .config ["$stateProvider", "$urlRouterProvider", "$locationProvider", ($stateProvider, $urlRouterProvider, $locationProvider) ->

    # $locationProvider.html5Mode true

    $urlRouterProvider.otherwise("/projects?archived=false&sort=updated_at&view=boards")

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

      # Does the following even make sense?
      # .state "projects.project",
      #   url: "/:projectId"
      #   templateUrl: "views/projects/show.html"

      .state "projects.new",
        url: "/new"
        onEnter: ["$state", "$modal", "$projects", "Config", ($state, $modal, $projects, Config) ->
          $modal.open
            templateUrl: "views/projects/new.html"
            controller: "NewProjectController"
            size: Config.MODAL_SIZE
          .result.then (newProject) ->
            $projects.push(newProject)
            $state.go "projects"
          , ->
            $state.go "projects"
        ]

      .state "projects.edit",
        url: "/:projectId/edit"
        onEnter: ["$stateParams", "$state", "$modal", "$projects", "Config", ($stateParams, $state, $modal, $projects, Config) ->
          $modal.open
            templateUrl: "views/projects/edit.html"
            controller: "EditProjectController"
            size: Config.MODAL_SIZE
            resolve:
              $project: ->
                # TODO: Remove dependency on Underscore
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
        url: "/projects/:projectId/sprints?archived&view&sort"
        templateUrl: "views/sprints/index.html"
        controller: "SprintsController"
        resolve:
          $project: ["Project", "$stateParams", (Project, $stateParams) ->
            Project.get(projectId: $stateParams.projectId).$promise
          ]
          $sprints: ["Project", "$stateParams", (Project, $stateParams) ->
            Project.sprints(projectId: $stateParams.projectId).$promise
          ]

      # Does the following even make sense?
      # .state "sprints.sprint",
      #   url: "/:sprintId"
      #   templateUrl: "views/sprints/show.html"

      .state "sprints.new",
        url: "/new"
        onEnter: ["$state", "$modal", "$sprints", "$project", "Config", ($state, $modal, $sprints, $project, Config) ->
          $modal.open
            templateUrl: "views/sprints/new.html"
            controller: "NewSprintController"
            size: Config.MODAL_SIZE
            resolve:
              $project: ->
                $project
          .result.then (newSprint) ->
            $sprints.push(newSprint)
            $state.go "sprints"
          , ->
            $state.go "sprints"
        ]

      .state "sprints.edit",
        url: "/:sprintId/edit"
        onEnter: ["$stateParams", "$state", "$modal", "$sprints", "Config", ($stateParams, $state, $modal, $sprints, Config) ->
          $modal.open
            templateUrl: "views/sprints/edit.html"
            controller: "EditSprintController"
            size: Config.MODAL_SIZE
            resolve:
              $sprint: ->
                # TODO: Remove dependency on Underscore
                _.findWhere($sprints, id: parseInt($stateParams.sprintId))
          .result.then (updatedSprint) ->
            $state.go "sprints"
          , ->
            $state.go "sprints"
        ]

      ###########
      # Columns #
      ###########
      .state "columns",
        url: "/projects/:projectId/sprints/:sprintId/columns"
        templateUrl: "views/columns/index.html"
        controller: "ColumnsController"
        resolve:
          $project: ["Project", "$stateParams", (Project, $stateParams) ->
            Project.get(projectId: $stateParams.projectId).$promise
          ]
          $sprint: ["Sprint", "$stateParams", (Sprint, $stateParams) ->
            Sprint.get(sprintId: $stateParams.sprintId).$promise
          ]
          $columns: ["Sprint", "$stateParams", (Sprint, $stateParams) ->
            Sprint.columns(sprintId: $stateParams.sprintId).$promise
          ]

      .state "columns.new",
        url: "/new"
        onEnter: ["$state", "$modal", "$project", "$sprint", "Config", ($state, $modal, $project, $sprint, Config) ->
          $modal.open
            templateUrl: "views/columns/new.html"
            controller: "NewColumnController"
            size: Config.MODAL_SIZE
          .result.then (newColumn) ->
            $columns.push(newColumn)
            $state.go "columns"
          , ->
            $state.go "columns"
        ]

      .state "columns.edit",
        url: "/:columnId/edit"
        onEnter: ["$stateParams", "$state", "$modal", "$columns", "Config", ($stateParams, $state, $modal, $columns, Config) ->
          $modal.open
            templateUrl: "views/columns/edit.html"
            controller: "EditColumnController"
            size: Config.MODAL_SIZE
            resolve:
              $column: ->
                # TODO: Remove dependency on Underscore
                _.findWhere($columns, id: parseInt($stateParams.columnId))
          .result.then (updatedColumn) ->
            $state.go "columns"
          , ->
            $state.go "columns"
        ]

      #########
      # Tasks #
      #########
      .state "tasks",
        abstract: true
        url: "/projects/:projectId/sprints/:sprintId/columns/:columnId/tasks"
        controller: "TasksController"
        resolve:
          $project: ["Project", "Sprint", "Column", "$stateParams", (Project, Sprint, Column, $stateParams) ->
            Project.get(projectId: $stateParams.projectId).$promise
          ]
          $sprint: ["Sprint", "$stateParams", (Sprint, $stateParams) ->
            Sprint.get(sprintId: $stateParams.sprintId).$promise
          ]
          $column: ["Column", "$stateParams", (Column, $stateParams) ->
            Column.get(columnId: $stateParams.columnId).$promise
          ]
          $tasks: ["$column", ($column) ->
            $column.tasks
          ]

      .state "tasks.new",
        url: "/new"
        onEnter: ["$state", "$modal", "$project", "$sprint", "$column", "$tasks", "Config", ($state, $modal, $project, $sprint, $column, $tasks, Config) ->
          $modal.open
            templateUrl: "views/tasks/new.html"
            controller: "NewTaskController"
            size: Config.MODAL_SIZE
          .result.then (newTask) ->
            $tasks.push(newTask)
            $state.go "columns"
          , ->
            $state.go "columns"
        ]

      .state "tasks.edit",
        url: "/:taskId/edit"
        onEnter: ["$stateParams", "$state", "$modal", "$project", "$sprint", "$column", "$tasks", "Config", ($stateParams, $state, $modal, $project, $sprint, $column, $tasks, Config) ->
          $modal.open
            templateUrl: "views/tasks/edit.html"
            controller: "EditTaskController"
            size: Config.MODAL_SIZE
            resolve:
              $task: ->
                # TODO: Remove dependency on Underscore
                _.findWhere($tasks, id: parseInt($stateParams.taskId))
          .result.then (updatedTask) ->
            $state.go "columns"
          , ->
            $state.go "columns"
        ]

      return

  ]