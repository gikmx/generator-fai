'use strict'

Process = require 'child_process'
Path    = require 'path'

Gulp    = require 'gulp'

Gulp.task 'init', ->

	bash = Process.spawn 'bash', ['init.sh', '<%= RepoName %>'], cwd: __dirname

	bash.stdout.on 'data', (data)->
		process.stdout.write data.toString('utf-8')

	bash.stderr.on 'error', (data)->
		process.stdout.write "\u001b[31m#{data.toString('utf-8')}\u001b[0m"