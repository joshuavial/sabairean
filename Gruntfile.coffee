module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean:
      files: ["tmp/", "app/css", "app/js", "app/partials"]

    haml:
      app:
        files: 
          "app/index.html" : "_app/index.haml"
          "app/partials/topics.html" : "_app/partials/topics.haml"
          "app/partials/chapters.html" : "_app/partials/chapters.haml"
          "app/partials/chapter.html" : "_app/partials/chapter.haml"

    sass:
      dist:
        files: 
          'app/css/app.css' : '_app/css/app.sass'

    coffee:
      scripts: 
        files: [
          expand: true,
          cwd: './_app/js',
          src: ['*.coffee'],
          dest: 'app/js',
          ext: '.js'
        ,
          expand: true,
          cwd: './_test/e2e',
          src: ['*.coffee'],
          dest: './test/e2e',
          ext: '.js'
        ,
          expand: true,
          cwd: './_test/unit',
          src: ['*.coffee'],
          dest: './test/unit',
          ext: '.js'
        ]

    watch:
      js:
        files: ['_app/js/*', '_test/**/*']
        tasks: ['coffee']

      css:
        files: ['_app/css/*']
        tasks: ['sass']

      haml:
        files: ['_app/*', '_app/partials/*']
        tasks: ['haml']

  grunt.loadTasks "tasks"

  grunt.loadNpmTasks('grunt-haml')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-watch')

  grunt.registerTask "default", ["clean", "haml", "coffee", "sass"]

