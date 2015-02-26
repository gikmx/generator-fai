'use strict';

Yeoman = require 'yeoman-generator'
Chalk  = require 'chalk'

module.exports = Yeoman.generators.Base.extend

	constructor: ->
		Yeoman.Base.apply @, arguments
		@argument 'BundleName', (type:'string', required:true)

	writing: ->
		try
			@BundleName = @_.slugify @BundleName
			@BundleDir  = "app/bundles/#{@BundleName}"
			@BundleVars = BundleName: @BundleName

			@mkdir @BundleDir

			@template 'control.coffee', "#{@BundleDir}/control.coffee", @BundleVars
			@template 'view.styl'     , "#{@BundleDir}/view.styl"     , @BundleVars
			@template 'view.jade'     , "#{@BundleDir}/view.jade"     , @BundleVars
			@template 'view.coffee'   , "#{@BundleDir}/view.coffee"   , @BundleVars
		catch e
			@log Chalk.red e.message
