#!/bin/sh

set -e

# Flag to start execution from 09_generate_rootfs.sh
start=false

for script in $(ls | grep '^[0-9]*_.*.sh' | sort); do
  if [ "$script" = "08_prepare_bundles.sh" ]; then
    start=true
  fi

  # If the flag is set to true, execute the script
  if [ "$start" = true ]; then
    echo "Executing script '$script'."
    ./$script
  fi
done
