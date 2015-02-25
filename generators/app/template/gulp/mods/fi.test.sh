path=`dirname ${BASH_SOURCE[0]}`
source $path/../utils/spinner.sh

spinner $$ "Compiling and testing 'fi'" &

coffee -e 'require "./fi"' 1> /dev/null 2>&1
bower install #1> /dev/null 2>&1
if [ ! -f  "app.coffee" ]; then
	printf "require './fi'\n\nﬁ.listen()" > app.coffee
fi
