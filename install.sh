#!/bin/bash

install_script() {
  local script_name="$1"
  cp "./$script_name.sh" "/usr/local/bin/$script_name"
  chmod +x "/usr/local/bin/$script_name"
  echo "$script_name installed successfully."
}

install_script "make-playlist"
install_script "make-input-file"
install_script "prepare-stream"