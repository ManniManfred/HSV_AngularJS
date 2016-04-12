var gulp = require('gulp');
var concat = require('gulp-concat');
var concatCss = require('gulp-concat-css');
var cssmin = require('gulp-cssmin');
var preprocess = require('gulp-preprocess');
var sourcemaps = require('gulp-sourcemaps');
var uglify = require('gulp-uglify');
var ngAnnotate = require('gulp-ng-annotate');
var rename = require("gulp-rename");
var argv = require('yargs').argv;
var templateCache = require('gulp-angular-templatecache');

var targetName = 'HsvWeb';
if (argv.targetName != null)
	targetName = argv.targetName;

var outputPath = 'Build/' + targetName;
var tmpPath = 'Build/.tmp';

gulp.task('default', function() {
	console.log('Erstelle ' + targetName);
	
	gulp.src('app/components/**/*.html')
		.pipe(templateCache({'root': 'app/components/', 'module': 'LeagueManager'}))
		.pipe(gulp.dest(tmpPath));
	
	gulp.start('concat-css');
	gulp.start('concat-js');
	gulp.start('make-index');
	
	// copy files
	gulp.src(['assets/img/**'])
		.pipe(gulp.dest(outputPath + '/assets/img'));
		
	gulp.src(['bower_components/bootstrap/dist/**'])
		.pipe(gulp.dest(outputPath + '/bootstrap'));
		
	gulp.src(['config.' + targetName + '.js'])
		.pipe(rename('config.js'))
		.pipe(gulp.dest(outputPath));
});

gulp.task('concat-css', function() {
	gulp.src([
		'assets/libs/ng-ckeditor.css',
		'assets/css/app.css'])
	.pipe(concatCss('lm.css'))
	.pipe(cssmin())
	.pipe(gulp.dest(outputPath));
});

gulp.task('concat-js', function () {
	console.log("templates: " + tmpPath + '/templates.js');
    gulp.src([
			// 'config' + targetName + '.js',
			'bower_components/moment/moment.js',
			'bower_components/jquery/dist/jquery.min.js',
			'bower_components/bootstrap/dist/js/bootstrap.min.js',
			'bower_components/angular/angular.min.js',
			'bower_components/angular-route/angular-route.min.js',
			'bower_components/angular-sanitize/angular-sanitize.min.js',
			'assets/libs/php_crud_api_transform.js',
			'assets/libs/ckeditor/ckeditor.js',
			'assets/libs/ng-ckeditor.min.js',
			'app/**/*.js',
			tmpPath + '/templates.js'])
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

