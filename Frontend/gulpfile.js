var gulp = require('gulp');
var concat = require('gulp-concat');
var concatCss = require('gulp-concat-css');
var cssmin = require('gulp-cssmin');
var preprocess = require('gulp-preprocess');
var sourcemaps = require('gulp-sourcemaps');
var uglify = require('gulp-uglify');
var ngAnnotate = require('gulp-ng-annotate');

var outputPath = './build';

gulp.task('HsvWeb', function() {
	outputPath = '../build/hsv_web';
	gulp.start('concat-css');
	gulp.start('concat-js');
	gulp.start('make-index');
	
	// copy files
	gulp.src(['config.js'])
  .pipe(gulp.dest(outputPath));
});

gulp.task('concat-css', function() {
	gulp.src(['bower_components/bootstrap/dist/css/bootstrap.min.css',
		'assets/libs/ng-ckeditor.css',
		'assets/css/app.css'])
	.pipe(concatCss('lm.css'))
	.pipe(cssmin())
	.pipe(gulp.dest(outputPath));
});

gulp.task('concat-js', function () {
    gulp.src([
			'bower_components/moment/moment.js',
			'bower_components/jquery/dist/jquery.min.js',
			'bower_components/bootstrap/dist/js/bootstrap.min.js',
			'bower_components/angular/angular.min.js',
			'bower_components/angular-route/angular-route.min.js',
			'bower_components/angular-sanitize/angular-sanitize.min.js',
			'assets/libs/php_crud_api_transform.js',
			'assets/libs/ckeditor/ckeditor.js',
			'assets/libs/ng-ckeditor.min.js',
			'app/**/*.js'])
    //.pipe(sourcemaps.init())
        .pipe(concat('app-concat.js'))
        .pipe(ngAnnotate())
        //.pipe(uglify())
    //.pipe(sourcemaps.write())
    .pipe(gulp.dest(outputPath));
});

gulp.task('make-index', function() {
	gulp.src('index.html')
	.pipe(preprocess({context: {BUILD: true}}))
	.pipe(gulp.dest(outputPath));
});

