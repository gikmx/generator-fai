# Set here variables that you want to be available on every view
# please not that if you modify these variables in runtime
# they will change for every user.
locals = {}

locals.rootClasses = []
locals.rootClasses.push 'no-js'
locals.rootClasses.push 'dev-mode' if not ﬁ.conf.live

module.exports = locals

