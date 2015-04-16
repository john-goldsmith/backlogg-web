gulp = require "gulp"
$ = require("gulp-load-plugins")(
  pattern: "*"
)
browserSync = $.browserSync.create()
reload = browserSync.reload

config =
  src:
    jade: [
      "app/*.jade"
      "app/views/**/*.jade"
    ]
    sass: "app/styles/application.sass"
    coffee: "app/scripts/**/*.coffee"
    images: "app/images/**/*.{png,jpg,jpeg,gif,svg}"
  dest: "./dist"

gulp.task "default", ->
  console.log "Default task not configured."

gulp.task "jade", ->
  gulp.src config.src.jade
    .pipe $.jade
      pretty: true
    .pipe $.angularHtmlify
      customPrefixes: ["ui-"]
      verbose: true
    .pipe gulp.dest config.dest
    .pipe reload stream: true

gulp.task "sass", ->
  gulp.src config.src.sass
    .pipe $.sass
      indentedSyntax: true
      errorLogToConsole: true
    .pipe $.minifyCss()
    .pipe $.rename suffix: ".min"
    .pipe gulp.dest "#{config.dest}/styles"
    .pipe $.filesize()
    .pipe reload stream: true

gulp.task "coffee", ->
  gulp.src config.src.coffee
    .pipe $.coffee()
    # .pipe $.concat "application.js"
    # .pipe $.uglify()
    # .pipe $.rename suffix: ".min"
    .pipe gulp.dest "#{config.dest}/scripts"
    # .pipe $.filesize()
    # .pipe reload stream: true

gulp.task "images", ->
  gulp.src config.src.images
    .pipe $.imagemin()
    .pipe gulp.dest "#{config.dest}/images"

gulp.task "build", ->
  $.runSequence "clean", "images", "sass", "coffee", "jade", "useref", "minify:js", "clean:build"

gulp.task "clean", ->
  $.del config.dest

gulp.task "serve", ->
  $.runSequence "clean", "images", "sass", "coffee", "jade", "useref", "browser-sync"

gulp.task "useref", ->
  assets = $.useref.assets()
  gulp.src "#{config.dest}/index.html"
    .pipe assets
    .pipe assets.restore()
    .pipe $.useref()
    .pipe gulp.dest config.dest

gulp.task "minify:js", ->
  gulp.src "#{config.dest}/scripts/application.js"
    .pipe $.uglify()
    .pipe $.rename suffix: ".min"
    .pipe gulp.dest "#{config.dest}/scripts"
    .pipe $.filesize()
    .pipe reload stream: true

gulp.task "clean:build", ->
  $.del ["#{config.dest}/scripts/**/*", "!#{config.dest}/scripts/application.min.js"]

gulp.task "browser-sync", ->
  browserSync.init
    server:
      baseDir: "./dist"

  gulp.watch config.src.jade, ["jade", "useref"]
  gulp.watch "app/styles/**/*.{sass,scss}", ["sass"]
  gulp.watch config.src.coffee, ["coffee"]