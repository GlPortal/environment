#!/usr/bin/env bash
echo "Remove GlPortal clone"
echo "Name of the clone, followed by [ENTER]:"
read name

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
cd ..
rm -rf repositories/clients/$name
