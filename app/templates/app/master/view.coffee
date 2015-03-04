window.ﬁ     = {}
ﬁ.readyStack = []

onReady = ->
	ﬁ.rootClasses = document.documentElement.className.split ' '
	# Remove 'no-js' class.
	ﬁ.rootClasses.slice(ﬁ.rootClasses.indexOf('no-js'), 1)
	# Execute all onReady functions
	(fn.call(this) if typeof fn is 'function') for fn in ﬁ.readyStack
	# Insert your master client-side javascript here.

document.addEventListener 'DOMContentLoaded', onReady, false
