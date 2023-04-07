#!/usr/bin/env bash

# Small script to set up local git user stuff
#   since I have an aversion to global setup
#   and want to reserve the ability to use different
#   accounts for different projects.

echo -n "Who should I set up this git repository for? "
read -r name

declare -A usernames=(
  [dan]="danielmckinnonanderson"
)

declare -A emails=(
  [dan]="danielmckinnon.anderson@gmail.com"
)

if [ ${usernames[$name]+_} ]; then 
  git config --local user.name "${usernames[$name]}" &&
    git config --local user.email "${emails[$name]}" 

  if [ $? = 0 ] ; then
    echo "Set up repository with username ${usernames[$name]} 👍"
    exit 0;
  else
    echo "Couldn't set up repository for $name..."
    exit 1;
  fi

else echo "No settings for $name found"; 
fi

exit 1;

