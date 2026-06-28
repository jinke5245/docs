#!/usr/bin/env bash

require_command() {
  for command_name in "$@"; do
    if ! command -v "$command_name" &> /dev/null; then
      printf "ERROR: missing required command: %s\n" "${command_name}" >&2
      exit 1
    fi
  done
}

require_env() {
  for var_name in "$@"; do
    if [ -z "${!var_name:-}" ]; then
      printf "ERROR: missing required environment variable: %s\n" "${var_name}" >&2
      exit 1
    fi
  done
}

ensure_writable_dir() {
  local dir_path="$1"

  if [ ! -d "$dir_path" ]; then
    mkdir -p "$dir_path" || {
      printf "ERROR: failed to create directory: %s\n" "${dir_path}" >&2
      exit 1
    }
  fi

  if [ -w "$dir_path" ]; then
    return
  fi

  require_command sudo
  sudo chown -R "$(id -u):$(id -g)" "$dir_path" || {
    printf "ERROR: failed to change ownership of directory: %s\n" "${dir_path}" >&2
    exit 1
  }
}
