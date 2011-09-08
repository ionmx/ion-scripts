#!/bin/bash
if [[ $# == 0 ]]; then
  PROJECT_DIR=$PWD
elif [[ $# == 1 && -d "$1" ]]; then
  PROJECT_DIR="$@"
else
  print "usage: rails-term.sh [rails project directory]"
  return 1
fi

cd $PROJECT_DIR

gnome-terminal \
  --tab -t "Controllers" --working-directory=$PROJECT_DIR/app/controllers \
  --tab -t "Views" --working-directory=$PROJECT_DIR/app/views \
  --tab -t "Models" --working-directory=$PROJECT_DIR/app/models \
  --tab -t "Config" --working-directory=$PROJECT_DIR/config \
  --tab -t "Javascript" --working-directory=$PROJECT_DIR/public/javascripts \
  --tab -t "Styles" --working-directory=$PROJECT_DIR/app/stylesheets \
  --tab -t "Server" -e "sh -x -c 'rails s'" \
  --tab -t "Console" -e "sh -x -c 'rails c'" \
  --tab -t "MySQL" -e "sh -x -c 'mysql -u root -p '" \
  --tab -t "Log" -e "sh -x -c 'tail -f log/development.log'"
