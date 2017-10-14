#!/bin/sh
DIR="'$(cd "$(dirname "$0")/../" && pwd | sed "s/'/'\\\''/g")'"
rx-repo-use() {
    repo=$1
    if [[ -n "$repo" ]]; then
        cd ${DIR//\'}/repositories/$repo
    else
        echo "Argument missing"
    fi
}

rx-client-use() {
    client=$1
    if [[ -n "$repo" ]]; then
        cd ${DIR//\'}/repositories/clients/$client
    else
        echo "Argument missing"
    fi
}

