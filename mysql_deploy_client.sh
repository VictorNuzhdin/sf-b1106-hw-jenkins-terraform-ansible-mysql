#!/bin/bash

clear

echo '--UPDATING OS PACKAGES LIST..'
apt update
echo

echo '--INSTALLING MYSQL CLI..'
apt install -y mysql-client
echo

echo '--DONE'
