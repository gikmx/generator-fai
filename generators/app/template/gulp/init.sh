test -z `which git` && echo "GIT is missing." 1>&2 && exit 1
test -z `which npm`  && echo "NPM is missing."  1>&2 && exit 1
test -z `which bower` && echo "Bower is missing." 1>&2 && exit 1
test -z `which coffee` && echo "Coffee is missing." 1>&2 && exit 1
test -z `which nodemon` && echo "Nodemon is missing." 1>&2 && exit 1

# Set paths
path=`pwd -P`
path_root=`cd .. && pwd -P`
path_fi="$path_root/fi"

# make sure fi is available and updated
cd $path_root
git submodule update --init
echo "Git submodule 'fi' updated successfully."

# initialize fi
cd $path_fi
bash "$path/mods/fi.init.sh"
echo -e "\n'fi' initialised successfully. "

cd $path_root
bash "$path/mods/fi.test.sh"
echo -e "\n'fi' compiled and tested successfully."

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
echo "run 'nodemon app.coffee --port=9000' to start."