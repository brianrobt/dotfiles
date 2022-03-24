#!/bin/bash

workspace="$HOME/workspace"

for dir in "$workspace"/*; do
  echo "Changing dirs to $dir"
  cd "$dir" || return
  remotes=$(git remote)
  for remote in $remotes; do
    if [ "$remote" == "upstream" ]; then
      branch=$(git branch --show-current)
      git fetch
      git merge upstream/"$branch"
      echo "$dir: Done merging upstream"
      git push origin "$branch"
      echo "$dir: Done updating origin"
    fi
  done
  cd ..
done
