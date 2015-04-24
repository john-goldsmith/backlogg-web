angular.module "backloggWeb.services"

  .factory "apiUrl", ["CONFIG", (CONFIG) ->
      protocol = if CONFIG.API_HTTPS then "https" else "http"
      apiUrl = "#{protocol}://#{CONFIG.API_HOST}:#{CONFIG.API_PORT}#{CONFIG.API_ROOT}"
      apiUrl
    ]