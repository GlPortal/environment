#!/usr/bin/env bash
echo "Generating new GlPortal clone"
echo "Name of the clone, followed by [ENTER]:"
read name

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
cd ..
mkdir -p repositories/clients
cd repositories/clients
rmdir -p $name
echo "Cloning"
git clone git@github.com:GlPortal/glPortal.git $name
echo "Updating submodules"
cd $name
git submodule update --recursive --init
cd ..
