#!/usr/bin/env bash

set -euo pipefail

. "$(cd "$(dirname "$0")" && pwd)/library_scripts.sh"

ensure_node_modules() {
  require_command pnpm

  if [[ -f node_modules/.modules.yaml ]]; then
    return
  fi

  pnpm install --frozen-lockfile
}

main() {
  ensure_node_modules
}

main "$@"
