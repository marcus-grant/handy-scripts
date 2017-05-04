#!/bin/bash

# A script that links all scripts in this folder to /usr/local/bin
# Used so all the scripts in my script folder can be cloned into any system
#	and be ready to be used as quickly as possible in a new system

# Get path of this script in local environment
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Get filenames of all scripts in this directory
# Also check if any of these filenames already exist at /usr/local/bin delete if so
DESTINATION="/usr/local/bin"
echo "Linking all scripts in $DIR to $DESTINATION"
for FILE in $DIR/*; do
  if [ -e $DESTINATION/${FILE##*/} ]; then
    rm $DESTINATION/${FILE##*/}
  fi
  # skip this script in the linking command or doesn't have a script filename extension
  if [ ${FILE##*/} != "link-scripts.sh" ]; then
    if [ ${FILE: -3} == ".sh" ]; then
      ln -s $DIR/${FILE##*/} $DESTINATION/${FILE##*/}
    elif [[ ${FILE: -3} == ".py" ]]; then
      ln -s $DIR/${FILE##*/} $DESTINATION/${FILE##*/}
    fi
  fi
done

echo "Linking complete! Here are all the scripts in $DESTINATION"
ls -la $DESTINATION
