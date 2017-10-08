#!/bin/sh
DIR="'$(cd "$(dirname "$0")/../" && pwd | sed "s/'/'\\\''/g")'"
alias rx-update="$DIR/bin/clone-or-pull-repositories.sh"
alias rx-clone="$DIR/bin/clone.sh"
alias rx-delete="$DIR/bin/delete.sh"
