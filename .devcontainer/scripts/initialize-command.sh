#!/usr/bin/env bash

set -euo pipefail

ensure_host_codex_dir() {
  if [[ -z "${HOME:-}" ]]; then
    printf "ERROR: missing required environment variable: HOME\n" >&2
    exit 1
  fi

  mkdir -p "${HOME}/.codex"
}

main() {
  ensure_host_codex_dir
}

main "$@"
