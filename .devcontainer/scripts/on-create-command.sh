#!/usr/bin/env bash

set -euo pipefail

. "$(cd "$(dirname "$0")" && pwd)/library_scripts.sh"

ensure_node_env() {
  require_command pnpm

  local pnpm_store_dir="${PNPM_STORE_DIR:-.pnpm-store}"

  ensure_writable_dir "$pnpm_store_dir"
  ensure_writable_dir "node_modules"

  pnpm config set store-dir "$pnpm_store_dir"

  if [[ -n "${NPM_REGISTRY:-}" ]]; then
    pnpm config set registry "${NPM_REGISTRY}"
  fi
}

main() {
  ensure_node_env
}

main "$@"
