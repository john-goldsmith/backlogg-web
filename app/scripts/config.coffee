angular.module("backloggWeb")

  .constant "Config",
    API_HTTPS: false
    API_HOST: "localhost"
    API_PORT: 9292
    API_ROOT: "/api/v1" # Include leading slash, but not trailing slash
    MODAL_SIZE: "lg"

  .factory "apiUrl", ["Config", (Config) ->
    protocol = if Config.API_HTTPS then "https" else "http"
    apiUrl = "#{protocol}://#{Config.API_HOST}:#{Config.API_PORT}#{Config.API_ROOT}"
    apiUrl
  ]

  .config ["$httpProvider", "$sceDelegateProvider", "$urlRouterProvider", ($httpProvider, $sceDelegateProvider, $urlRouterProvider) ->

    $httpProvider.defaults.useXDomain = true
    # $httpProvider.defaults.withCredentials = false
    delete $httpProvider.defaults.headers.common["X-Requested-With"]

    # $httpProvider.defaults.headers.common["Accept"] = "application/json"
    # $httpProvider.defaults.headers.common["Content-Type"] = "application/json"
    # $httpProvider.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded"
    # $httpProvider.defaults.headers.put["Content-Type"] = "application/x-www-form-urlencoded"

    $sceDelegateProvider.resourceUrlWhitelist ["self", "http://localhost:9292/*", "http://localhost:9292/api/*", "http://localhost:9292/api/v1/*", "http://localhost:9292/api/v1/projects"]

    # RestangularProvider.setBaseUrl "http://localhost:9292/api/v1"

    # $urlRouterProvider.deferIntercept()

  ]

  .config ["datepickerConfig", "datepickerPopupConfig", "timepickerConfig", (datepickerConfig, datepickerPopupConfig, timepickerConfig) ->
    datepickerConfig.showWeeks = false
    datepickerConfig.minDate = new Date()

    datepickerPopupConfig.closeText = "Close"
    datepickerPopupConfig.datepickerPopup = "MM/dd/yyyy"

    timepickerConfig.hourStep = 1
    timepickerConfig.minuteStep = 15
    timepickerConfig.showMeridian = true
  ]