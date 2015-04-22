# Karma configuration
# Generated on Tue Jan 06 2015 21:47:35 GMT-0800 (PST)

module.exports = (config) ->

  config.set

    # base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: "."

    # frameworks to use
    # available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: [
      "jasmine"
    ]

    # list of files / patterns to load in the browser
    files: [
      "bower_components/angular/angular.js"
      "bower_components/angular-mocks/angular-mocks.js"
      "bower_components/angular-animate/angular-animate.js"
      "bower_components/angular-cookies/angular-cookies.js"
      "bower_components/angular-resource/angular-resource.js"
      "bower_components/angular-route/angular-route.js"
      "bower_components/angular-sanitize/angular-sanitize.js"
      "bower_components/angular-touch/angular-touch.js"
      # "bower_components/angular-bootstrap/ui-bootstrap.js"
      "bower_components/angular-bootstrap/ui-bootstrap-tpls.js"
      "bower_components/angular-ui-router/release/angular-ui-router.js"

      "app/scripts/**/*.coffee"

      "app/spec/**/*.coffee"
    ]

    # list of files to exclude
    exclude: []

    # Which plugins to enable
    plugins: [
      # "karma-phantomjs-launcher"
      "karma-chrome-launcher"
      "karma-jasmine"
      "karma-coffee-preprocessor"
      "karma-coverage"
    ]

    # preprocess matching files before serving them to the browser
    # available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors:
      "app/spec/**/*.coffee": [
        "coffee"
      ]
      "app/scripts/**/*.coffee": [
        "coffee"
        "coverage"
      ]

    # test results reporter to use
    # possible values: "dots", "progress"
    # available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: [
      "progress"
      "coverage"
    ]

    coverageReporter:
      type: "html"
      dir: "app/spec/coverage/"

    # web server port
    port: 9876

    # enable / disable colors in the output (reporters and logs)
    colors: true

    # level of logging
    # possible values:
    # - config.LOG_DISABLE
    # - config.LOG_ERROR
    # - config.LOG_WARN
    # - config.LOG_INFO
    # - config.LOG_DEBUG
    logLevel: config.LOG_INFO

    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: true

    # start these browsers
    # available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: [
      "Chrome"
    ]

    # Continuous Integration mode
    # if true, Karma captures browsers, runs the tests and exits
    singleRun: false