#!/bin/zsh

is_sops_file() {
  if grep -q "sops" "$1" && sops filestatus "$1" 2>&1 | grep "true" &>/dev/null; then
    return 0
  else
    return 1
  fi
}

get_file_content() {
  if is_sops_file "$1"; then
    sops -d "$1"
  else
    cat "$1"
  fi
}

while [[ $# -gt 0 ]]; do
  case $1 in
  --check-only)
    if [[ -z "$2" ]]; then
      echo "Error: No file specified for --check-only"
      exit 1
    fi
    shift 1
    if is_sops_file "$1"; then
      exit 0
    else
      exit 1
    fi
    ;;
  *)
    get_file_content "$1"
    shift
    ;;
  esac
done
