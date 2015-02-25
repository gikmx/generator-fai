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
				name    : 'AppName'
				message : 'What\'s your app name?'
				default : @_.slugify @appname

		prompts.push
			store   : true
			type    : 'input'
			name    : 'RepoName'
			message : 'What\'s your fi repo?'
			default : 'ssh://bitbucket.gikmx/gikmx/fi.git'

		@prompt prompts, (answers)=>
			for key,val of answers
				val = @_.slugify val if key is 'AppName'
				@[key] = val
			do done

	writing:
		gulp: ->
			@template '_gulpfile.js'  , 'gulpfile.js'
			@directory 'gulp', '.gulp'
			@template 'gulp/init.sh', '.gulp/init.sh'

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