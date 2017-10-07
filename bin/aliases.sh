#!/bin/sh
DIR="'$(cd "$(dirname "$0")/../" && pwd | sed "s/'/'\\\''/g")'"
alias rx-update="$DIR/bin/clone-or-pull-repositories.sh"
