#!/usr/bin/env bash

# Script to convert all YAML files in the current directory to JSON

# Ensure yq is installed
if ! command -v yq &> /dev/null
then
    echo "yq could not be found. Please install yq."
    echo "For example, with Nix: nix-shell -p yq-go"
    echo "Or see: https://github.com/mikefarah/yq#install"
    exit 1
fi

shopt -s nullglob # Ensure loop doesn't run if no files are found

for yaml_file in ./*.yaml ./*.yml; do
  if [ -f "$yaml_file" ]; then
    base_name="${yaml_file%.*}" # Remove the extension
    json_file="${base_name}.json"
    echo "Converting ${yaml_file} to ${json_file}..."
    yq -o json "$yaml_file" > "$json_file"
  fi
done

shopt -u nullglob # Reset nullglob

echo "Conversion complete."
