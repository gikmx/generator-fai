'use strict';

Yeoman = require 'yeoman-generator'
Yeosay = require 'yosay'
Chalk  = require 'chalk'

module.exports = Yeoman.generators.Base.extend

	constructor: ->
		Yeoman.Base.apply @, arguments
		@argument 'AppName', (type:'string', required:false)


	initializing: ->
		@log Yeosay "Create your #{Chalk.yellow 'Fi'} app with super powers!"
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

		@prompt prompts, (answers)=>
			for key,val of answers
				val = @_.slugify val if key is 'AppName'
				@[key] = val
			do done

	writing: ->
		@directory 'fi'               , '.fi'
		@directory 'app'              , 'app'
		@template 'app.coffee'        , 'app.coffee'
		@template 'bowerrc'           , '.bowerrc'
		@template 'gitignore'         , '.gitignore'
		@template 'sublime-project'   , "#{@AppName}.sublime-project"
		@template '_gulpfile.js'      , 'gulpfile.js'
		@template '_nodemon.json'     , 'nodemon.json'
		@template '_browser-sync.json', 'browser-sync.json'
		@template '_bower.json'       , 'bower.json'                 , AppName: @AppName
		@template '_package.json'     , 'package.json'               , AppName: @AppName

	install: ->
		do @installDependencies