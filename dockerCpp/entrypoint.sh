#!/bin/bash
exitFunc(){

  if [ $noArguments == false ]
    then
      echo 'Exiting: git add and git commit first.'
      cd /home/conveyance
      git add .
      git commit -m "Auto repository saving when exiting development container. Time is $(date)."
      git config --global core.editor "vim"
      git commit --amend
      git push
  fi

  exit 0
}

trap exitFunc exit SIGTERM

noArguments=true
if [ $# -eq 0 ]
  then
    noArguments=true
    #echo "No arguments supplied"
  else
    noArguments=false
    #echo "There is argument supplied"
    git fetch
    gitk
fi
/bin/bash
