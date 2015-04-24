"use strict"

angular.module "backloggWeb.services"

  .constant "API_ENDPOINT", # Include leading slash
    PROJECTS: "/projects/:projectId"
    SPRINTS: "/sprints/:sprintId"
    COLUMNS: "/columns/:columnId"
    TASKS: "/tasks/:taskId"
    COMMENTS: "/projects/:projectId/comments"