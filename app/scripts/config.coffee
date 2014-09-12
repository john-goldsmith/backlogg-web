angular.module("backloggWeb")

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