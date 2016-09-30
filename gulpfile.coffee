gulp = require 'gulp'
coffee = require 'gulp-coffee'
rename = require 'gulp-rename'
minifycss = require 'gulp-minify-css'
server = require 'gulp-webserver'
del = require 'del'
sequence = require 'run-sequence'
tar = require 'gulp-tar'
gzip = require 'gulp-gzip'

config =
  name: 'aws-ec2-pages'
  version: '0.1.0'

gulp.task 'clean', (cb) ->
  del ['dist'], cb

gulp.task 'lib', ->
  gulp.src('lib/**')
    .pipe(gulp.dest('dist/assets/lib'))

gulp.task 'html', ->
  gulp.src(['src/main/app/html/*.html','src/main/app/favicon.ico'])
    .pipe(gulp.dest('dist'))

gulp.task 'php', ->
  gulp.src('src/main/app/php/**')
    .pipe(gulp.dest('dist'))

gulp.task 'css', ->
  gulp.src('src/main/app/css/**/*.css')
    .pipe(gulp.dest('dist/assets/app/css'))
    .pipe(rename({ suffix: '.min' }))
    .pipe(minifycss())
    .pipe(gulp.dest('dist/assets/app/css'))

gulp.task 'images', ->
  gulp.src('src/main/app/img/**/*')
    .pipe(gulp.dest('dist/assets/app/img'))

gulp.task 'robots', ->
  gulp.src(['src/main/app/robots.txt'])
    .pipe(gulp.dest('dist'))

gulp.task 'tar', ->
  gulp.src('dist/**')
    .pipe(tar("#{config.name}.tar"))
    .pipe(gzip())
    .pipe(gulp.dest('dist'))

gulp.task 'default', ['clean'], ->
  gulp.start 'lib', 'php', 'html', 'css', 'images', 'robots'

gulp.task 'dist', ['clean'], ->
  sequence ['lib', 'php', 'html', 'css', 'images', 'robots'], 'tar'

gulp.task 'run', ['lib', 'php', 'html', 'css', 'images', 'robots'], ->
  gulp.watch 'src/main/app/php/**/*.php', ['php']
  gulp.watch 'src/main/app/html/**/*.html', ['html']
  gulp.watch 'src/main/app/css/**/*.css', ['css']
  gulp.watch 'src/main/app/img/**/*', ['images']
  gulp.watch 'lib/**', ['lib']

  gulp.src('dist')
    .pipe(server(
      port: 9000
      livereload: true
    ))
