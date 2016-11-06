#!/bin/bash

echo Git username?
read username
echo email?
read email

git config --global user.name $username
git config --global user.email $email
git config --global core.editor vim
