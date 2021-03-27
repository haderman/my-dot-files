#!/bin/sh

# code --install-extension <extension>

filename='vscode-extensions-list.txt'

if ! command -v code &> /dev/null; then
  echo "code command could not be found"
  exit
fi

while IFS= read -r line; do
  # filter empty line and comments
  if [[ $line != \#* ]] && [[ -n $line ]]; then
    code --install-extension $line
  fi
done < $filename

echo "Install extensions: DONE"