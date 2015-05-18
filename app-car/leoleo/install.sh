#!/usr/bin/env bash

echo '### Create _source folder'
cd apps/web
mkdir _source

echo '### Install yeoman ...'
cd apps/appsh
sudo npm install -g yo bower grunt-cli
sudo npm install -g generator-angular
yo angular