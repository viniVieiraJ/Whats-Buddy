#!/bin/sh

if [ "$DOCKER_ENV" = "true" ];
then
  echo "Enabling environment variables for Docker"
  echo "DOCKER_ENV=$DOCKER_ENV"
  echo
else
  cp ./src/env.yml ./dist/src
fi
echo "> removing dist"
rm -rf ./dist
echo
echo "> transpiling..."
npm run build

echo
echo "> Successfully build "

echo
echo "> Starting application..."
echo

node ./src/main.js
