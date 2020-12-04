#!/usr/bin/env bash

cwd=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

vimport=$cwd
vdeployments=$cwd/../deployments

docker run -d \
  --name kc \
  -p 8080:8080 \
  -e KEYCLOAK_USER=admin \
  -e KEYCLOAK_PASSWORD=admin \
  -e KEYCLOAK_LOGLEVEL=DEBUG \
  -v $vdeployments:/opt/jboss/keycloak/standalone/deployments \
  -v $vimport:/tmp/import \
  jboss/keycloak:11.0.3 -b 0.0.0.0 -Dkeycloak.profile=preview

  ## doesn't work
  # -e KEYCLOAK_IMPORT=/tmp/import/my-realm.json \

echo ... server is staring ... may take some time
sleep 20

$cwd/setcredentials.sh
