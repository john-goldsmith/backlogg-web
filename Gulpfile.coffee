config = require "./Gulp.conf.coffee"

gulp = require "gulp"
$ = require("gulp-load-plugins")(
  pattern: "*"
)
browserSync = $.browserSync.create()
reload = browserSync.reload

gulp.task "default", ->
  console.log "Default task not configured."

gulp.task "compile:jade", ->
  gulp.src config.src.jade, base: "./app"
    .pipe $.jade
      pretty: true
    .pipe $.angularHtmlify
      customPrefixes: config.angularHtmlify.customPrefixes
      verbose: true
    .pipe gulp.dest config.dest.jade
    .pipe reload stream: true

gulp.task "compile:sass", ->
  gulp.src config.src.sass
    .pipe $.sass
      indentedSyntax: true
      errorLogToConsole: true
    .pipe $.minifyCss()
    .pipe $.rename suffix: config.minification.suffix
    .pipe gulp.dest config.dest.sass
    .pipe $.filesize()
    .pipe reload stream: true

gulp.task "compile:coffee", ->
  gulp.src config.src.coffee
    .pipe $.coffeelint()
    .pipe $.coffeelint.reporter()
    .pipe $.coffee()
    # .pipe $.concat "application.js"
    # .pipe $.uglify()
    # .pipe $.rename suffix: config.minification.suffix
    .pipe gulp.dest config.dest.coffee
    # .pipe $.filesize()
    # .pipe reload stream: true

gulp.task "compile:all", ->
  $.runSequence "compile:sass", "compile:coffee", "compile:jade"

gulp.task "build", ->
  $.runSequence "clean:all", "minify:images", "compile:all", "compile:sass", "compile:coffee", "compile:jade", "concat:all", "minify:js", "clean:build"

gulp.task "clean:all", ->
  $.del config.dest.base

# When serving in a development environment, it's desired to not have
# concatenated or minified resources for easier debugging.
gulp.task "serve", ->
  $.runSequence "clean:all", "minify:images", "compile:sass", "compile:coffee", "compile:jade", "browsersync"

gulp.task "concat:all", ->
  assets = $.useref.assets()
  gulp.src "#{config.dest.base}/index.html"
    .pipe assets
    .pipe assets.restore()
    .pipe $.useref()
    .pipe gulp.dest config.dest.base

gulp.task "minify:images", ->
  gulp.src config.src.images
    .pipe $.imagemin()
    .pipe gulp.dest config.dest.images

gulp.task "minify:js", ->
  gulp.src "#{config.dest.coffee}/application.js"
    .pipe $.uglify()
    .pipe $.rename suffix: config.minification.suffix
    .pipe gulp.dest config.dest.coffee
    .pipe $.filesize()
    .pipe reload stream: true

gulp.task "minify:css", ->
  gulp.src "#{config.dest.sass}/application.css"
    .pipe $.minifyCss()
    .pipe $.rename suffix: config.minification.suffix
    .pipe gulp.dest config.dest.sass
    .pipe $.filesize()
    .pipe reload stream: true

# Remove all JavaScript and CSS files except the manifests
gulp.task "clean:build", ->
  $.del ["#{config.dest.coffee}/**/*", "!#{config.dest.coffee}/application.min.js"]
  # $.del ["#{config.dest.sass}/**/*", "!#{config.dest.sass}/application.min.css"]

gulp.task "browsersync", ->
  browserSync.init
    server:
      baseDir: config.dest.base
      routes:
        "/bower_components": "./bower_components"
    notify: false

  gulp.watch config.src.jade, ["compile:jade"]
  gulp.watch "app/styles/**/*.{sass,scss}", ["compile:sass"]
  # gulp.watch config.src.coffee, ["compile:coffee"]
  # gulp.watch("scripts/**/*.js").on "change", reload
  # gulp.watch(config.src.coffee).on "change", reload
  # gulp.watch "scripts/**/*.js", ["foo"]

# gulp.task "foo", ["coffee"], reload

gulp.task "test", (done) ->
  $.karma.server.start
    configFile: config.karma.config
  , done