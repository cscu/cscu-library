/*jshint node:true */
module.exports = function (grunt) {
  "use strict";
  // Load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  grunt.initConfig({
    jshint: {
      options: {
        jshintrc: '.jshintrc'
      },
      gruntfile: 'Gruntfile.js',
      app: ['app/assets/javascripts/**/*.js']
    },
    coffeelint: {
      /*jshint camelcase:false */
      options: {
        max_line_length: {
          value: 150
        }
      },
      app: ['app/assets/javascripts/**/*.coffee']
    }
  });

  grunt.registerTask('lint', [
    'jshint',
    'coffeelint'
  ]);

  grunt.registerTask('default', ['lint']);
};
