'use strict';

Yeoman = require 'yeoman-generator'
Chalk  = require 'chalk'


module.exports = Yeoman.Base.extend

	constructor: ->
		Yeoman.Base.apply @, arguments
		@argument 'AppName', (type:'string', required:false)


	prompting: ->

		return do @async if @AppName and @AppName.length

		@prompt
			type    : 'input'
			name    : 'appname'
			message : 'What\'s your app name?',
			default : @_.slugify @appname
			(answer)=>
				@AppName = @_slanswer.appname.replace /\s+/g,'-'
				do @async

	# writing:
	# 	gulpfile    : -> @template '_gulpfile.js'  , 'gulpfile.js'
	# 	packageJSON : -> @template '_package.json' , 'package.json'

	# install: ->

	# 	@installDependencies()