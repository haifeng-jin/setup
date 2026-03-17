#!/bin/bash

# Get the current origin URL
REMOTE_URL=$(git config --get remote.origin.url)

if [[ -z "$REMOTE_URL" ]]; then
  echo "Error: No remote 'origin' found."
  exit 1
fi

if [[ "$REMOTE_URL" == https://github.com/* ]]; then
  # Extract the repository path
  REPO_PATH=${REMOTE_URL#https://github.com/}
  
  # Construct the new SSH URL
  NEW_URL="git@github.com:${REPO_PATH}"
  
  # Ensure it ends with .git
  if [[ "$NEW_URL" != *.git ]]; then
    NEW_URL="${NEW_URL}.git"
  fi

  echo "Switching remote origin from $REMOTE_URL to $NEW_URL..."
  git remote set-url origin "$NEW_URL"
  echo "Successfully switched remote to SSH connection."
else
  if [[ "$REMOTE_URL" == git@github.com:* ]]; then
    echo "The remote 'origin' is already using an SSH connection ($REMOTE_URL)."
  else
    echo "Remote origin is not a standard HTTPS GitHub URL: $REMOTE_URL"
    echo "Please update the script to handle this format."
  fi
fi
