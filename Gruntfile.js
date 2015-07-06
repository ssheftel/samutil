'use strict';

module.exports = function(grunt) {



  // Project configuration.
  grunt.initConfig({
    nodeunit: {

      files: ['test/**/*_test.js'],
    },
    jshint: {
      options: {
        jshintrc: '.jshintrc'
      },
      gruntfile: {
        src: 'Gruntfile.js'
      },
      lib: {
        src: ['lib/**/*.js']
      },
      test: {
        src: ['test/**/*.js']
      }
    },
    watch: {
      gruntfile: {
        files: '<%= jshint.gruntfile.src %>',
        tasks: ['jshint:gruntfile']
      },
      lib: {
        files: '<%= jshint.lib.src %>',
        tasks: ['jshint:lib', 'nodeunit']
      },
      test: {
        files: '<%= jshint.test.src %>',
        tasks: ['jshint:test', 'nodeunit']
      },
    },

    //ME

    jsduck: {
      main: {
        src: [
          'lib'
        ],
        dest: 'docs',
        options: {
          'builtin-classes': true,
          'warnings': ['-no_doc', '-dup_member', '-link_ambiguous'],
          'external': ['XMLHttpRequest']
        }
      }

    },

    coffee: {
      glob_to_multiple: {
          expand: true,
          flatten: true,
          cwd: 'coffee',
          src: ['*.coffee'],
          dest: 'lib',
          ext: '.js'
        }
    }
    //END ME
  });

  // These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-contrib-nodeunit');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-watch');

  //ME
  grunt.loadNpmTasks('grunt-jsduck');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  //ENDME

  // Default task.
  grunt.registerTask('default', ['jshint', 'nodeunit']);

};
