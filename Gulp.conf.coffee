module.exports =
  src:
    jade: [
      "app/*.jade"
      "app/views/**/*.jade"
    ]
    sass: "app/styles/**/*.{scss,sass}"
    coffee: "app/scripts/**/*.coffee"
    images: "app/images/**/*.{png,jpg,jpeg,gif,svg}"
  dest:
    base: "./dist"
    jade: "./dist"
    sass: "./dist/styles"
    coffee: "./dist/scripts"
    images: "./dist/images"
  minification:
    suffix: ".min"
  angularHtmlify:
    customPrefixes: ["ui-"]
  karma:
    config: "#{__dirname}/karma.conf.coffee"