'use strict';

Yeoman = require 'yeoman-generator'
Chalk  = require 'chalk'


module.exports = Yeoman.generators.Base.extend

	constructor: ->
		Yeoman.Base.apply @, arguments
		@argument 'AppName', (type:'string', required:false)


	initializing: ->
		@log Chalk.yellow 'Initializing …'
		@pkg = require '../package.json'

	prompting: ->
		done    = @async()
		prompts = [];

		if not @AppName
			prompts.push
				type    : 'input'
				name    : 'appname'
				message : 'What\'s your app name?'
				default : @_.slugify @appname

		prompts.push
			store   : true
			type    : 'input'
			name    : 'repo'
			message : 'What\'s your fi repo?'
			default : 'ssh://bitbucket.gikmx/gikmx/fi.git'

		@prompt prompts, (answer)=>
			@AppName = @_.slugify answer.appname
			do done

	writing:
		gulp: ->
			@template '_gulpfile.js'  , 'gulpfile.js'
			@directory 'gulp', '.gulp'

		bower: ->
			@template '_bower.json', 'bower.json', AppName: @AppName
			@template 'bowerrc'    , '.bowerrc'

		git: ->
			@template 'gitignore'  , '.gitignore'

		sublime: ->
			@template 'sublime-project', "#{@AppName}.sublime-project"

		json: ->
			@template '_package.json'     , 'package.json', AppName: @AppName
			@template '_nodemon.json'     , 'nodemon.json'
			@template '_browser-sync.json', 'browser-sync.json'

		# app:->

	install: ->
		do @installDependencies