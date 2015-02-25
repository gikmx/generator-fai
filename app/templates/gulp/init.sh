test -z `which git` && echo "GIT is missing." 1>&2 && exit 1

deps=(coffee-script bower nodemon browser-sync)
for dep in ${deps[@]}; do
	npm install -g $dep@latest
done


# Set paths
path=`pwd -P`
path_root=`cd .. && pwd -P`
path_fi="$path_root/fi"

echo "Cloning and setting up Fi…"
cd $path_root
git init
git submodule add -b develop --name fi $1 fi
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
echo "remember you can use:"
echo
echo "npm run watch (nodemon)"
echo "npm run sync  (browser-sync)"
echo