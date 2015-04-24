"use strict"

angular.module "backloggWeb.services"

  .constant "CONFIG",
    API_HTTPS: false
    API_HOST: "localhost"
    API_PORT: 9292
    API_ROOT: "/api/v1" # Include leading slash, but not trailing slash
    MODAL_SIZE: "lg"
    PROJECT_NAME: "Backlogg"
    DIRECTIVE_NAMESPACE: "bl"