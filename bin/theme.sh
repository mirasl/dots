#!/bin/bash
if [ $1 -gt 0 ]
then
  if [ $1 -lt 7 ]
  then
    printf "local current_theme = $1\nreturn current_theme" > ~/.config/awesome/current_theme.lua;
    echo "awesome.restart()" | awesome-client;
  else
    echo "Error - number out of range"
  fi
else
  echo "Error - number out of range"
fi 
