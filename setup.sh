#!/usr/bin/env sh

set -e

# Clear existing configuration
rm --recursive /etc/nixos && mkdir /etc/nixos

# Create symlinks to new configuration.
for file in "${PWD}"/config/*; do
    if [ -f "${file}" ]; then
        # If this is a file then create symlink to it.
        ln --symbolic --force "${file}" /etc/nixos/
    else
        # If this is a directory create symlinks to files in it.
        # We can't symlink directory itself because Nix tools don't handle
        # relative paths to parent directory correctly in this case.
        dirname=$(basename "${file}")
        mkdir /etc/nixos/"${dirname}"
        for nested in "${file}"/*; do
            ln --symbolic --force "${nested}" /etc/nixos/"${dirname}"
        done
    fi
done
