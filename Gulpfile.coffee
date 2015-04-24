config = require "./Gulp.conf.coffee"

G = require "gulp"
$ = require("gulp-load-plugins")(
  pattern: "*"
)
browserSync = $.browserSync.create()
reload = browserSync.reload

###
Primary tasks
###
G.task "default", ->
  console.log "Default task not configured."

G.task "build", ->
  $.runSequence "clean:all", "minify:images", "compile:all", "compile:sass", "compile:coffee", "compile:jade", "copy:utils", "concat:all", "minify:js", "clean:build"

# When serving in a development environment, it's desired to not have
# concatenated or minified resources for easier debugging.
G.task "serve", ->
  $.runSequence "clean:all", "minify:images", "compile:sass", "compile:coffee", "compile:jade", "copy:utils", "browsersync:app"

G.task "test", ->
  $.runSequence "clean:coverage", "karma", "browsersync:coverage"

###
Compilation tasks
###
G.task "compile:jade", ->
  G.src config.src.jade, base: "./app"
    .pipe $.jade
      pretty: true
    .pipe $.angularHtmlify
      customPrefixes: config.angularHtmlify.customPrefixes
      verbose: true
    .pipe G.dest config.dest.jade
    .pipe reload stream: true

G.task "compile:sass", ->
  G.src config.src.sass
    .pipe $.sass
      indentedSyntax: true
      errorLogToConsole: true
    .pipe $.minifyCss()
    .pipe $.rename suffix: config.minification.suffix
    .pipe G.dest config.dest.sass
    .pipe $.filesize()
    .pipe reload stream: true

G.task "compile:coffee", ->
  G.src config.src.coffee
    .pipe $.coffeelint()
    .pipe $.coffeelint.reporter()
    .pipe $.coffee()
    # .pipe $.concat "application.js"
    # .pipe $.uglify()
    # .pipe $.rename suffix: config.minification.suffix
    .pipe G.dest config.dest.coffee
    # .pipe $.filesize()
    # .pipe reload stream: true

G.task "compile:all", ->
  $.runSequence "compile:sass", "compile:coffee", "compile:jade"

###
Optimization tasks (concat, minify, etc.)
###
G.task "concat:all", ->
  assets = $.useref.assets()
  G.src "#{config.dest.base}/index.html"
    .pipe assets
    .pipe assets.restore()
    .pipe $.useref()
    .pipe G.dest config.dest.base

G.task "minify:images", ->
  G.src config.src.images
    .pipe $.imagemin()
    .pipe G.dest config.dest.images

G.task "minify:js", ->
  G.src "#{config.dest.coffee}/application.js"
    .pipe $.uglify()
    .pipe $.rename suffix: config.minification.suffix
    .pipe G.dest config.dest.coffee
    .pipe $.filesize()
    .pipe reload stream: true

G.task "minify:css", ->
  G.src "#{config.dest.sass}/application.css"
    .pipe $.minifyCss()
    .pipe $.rename suffix: config.minification.suffix
    .pipe G.dest config.dest.sass
    .pipe $.filesize()
    .pipe reload stream: true

###
Clean tasks
###
G.task "clean:all", ->
  $.del config.dest.base

G.task "clean:coverage", ->
  $.del "app/spec/coverage"

# Remove all JavaScript and CSS files except the manifests
G.task "clean:build", ->
  $.del ["#{config.dest.coffee}/**/*", "!#{config.dest.coffee}/application.min.js"]
  # $.del ["#{config.dest.sass}/**/*", "!#{config.dest.sass}/application.min.css"]

###
Copy tasks
###
G.task "copy:utils", ->
  G.src "app/scripts/util/**/*.js", base: "./app"
    .pipe G.dest config.dest.base

###
Server tasks
###
G.task "browsersync:app", ->
  browserSync.init
    server:
      baseDir: config.dest.base
      routes:
        "/bower_components": "./bower_components"
    notify: false

  G.watch config.src.jade, ["compile:jade"]
  G.watch config.src.sass, ["compile:sass"]
  G.watch config.src.coffee, ["compile:coffee", "browsersync:reload"]

G.task "browsersync:coverage", ->
  browserSync.init
    server:
      baseDir: "app/spec/coverage/Chrome 42.0.2311 (Mac OS X 10.10.3)"
    notify: false

  G.watch "app/spec/**/*.coffee", ["generate:coverage"]

G.task "browsersync:reload", ->
  reload()

###
Test and coverage tasks
###
G.task "generate:coverage", ->
  $.runSequence "compile:coffee", "clean:coverage", "karma", "browsersync:reload"

G.task "karma", (done) ->
  $.karma.server.start
    configFile: config.karma.config
    singleRun: true
  , done