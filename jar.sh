#!/usr/bin/env bash

cwd=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

_jar(){
  local dir="$1"
  cd "$cwd/$dir"
  rm .DS_Store
  zip -r "$cwd/$dir.jar" .
  cd "$cwd"
  cp "$cwd/$dir.jar" ./deployments
}

_jar "request-header-oidc-mapper"
