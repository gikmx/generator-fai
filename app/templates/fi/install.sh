test -z `which git` && echo "GIT is missing." 1>&2 && exit 1

# Set paths
path_root=`pwd -P`
path_fi="$path_root/fi"

deps=(npm coffee-script bower nodemon gulp browser-sync)
for dep in ${deps[@]}; do
	cmd=$dep
	[ "$dep"  == "coffee-script" ] && cmd='coffee'
	if $FI_SYS; then
		npm install -g $dep@latest
	else
		test -z `which $cmd` && echo "The module $dep is missing."  1>&2 && exit 1
	fi
done

echo "Cloning and setting up Fi…"
cd $path_root
git init
git submodule add -b develop --name 'fi' $FI_REPO 'fi'
git submodule update --init
cd $path_fi
rm -Rf node_modules
npm install --production
cd $path_root

echo "Compiling and testing Fi…"
coffee -e 'require "./fi"' 1> /dev/null 2>&1
if [ ! -f  "app.coffee" ]; then
	printf "require './fi'\n\nﬁ.listen()\n" > app.coffee
fi

echo
echo "   ▄████████  ▄█  "
echo "  ███    ███ ███  "
echo "  ███    █▀  ███▌ "
echo " ▄███▄▄▄     ███▌ "
echo "▀▀███▀▀▀     ███▌ "
echo "  ███        ███  "
echo "  ███        ███  "
echo "  ███        █▀   "
echo "                  "
echo
echo "Usage:"
echo
echo "npm run watch (nodemon)"
echo "npm run sync  (browser-sync)"
echo