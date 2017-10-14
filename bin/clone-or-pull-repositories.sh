#!/usr/bin/env bash
# @author Nikolas Lahtinen <nikolas.lahtinen@gmail.com>
#
# Clones or pulls the repositories defined bellow.
# NOTE: Repository url must end in .git

read -r -d '' REPOSITORIES << REPOSITORIES
git@github.com:GlPortal/glPortal.git
git@github.com:GlPortal/micro-site.git
git@github.com:GlPortal/map-editor.git
git@github.com:GlPortal/map-templates.git
REPOSITORIES

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
cd ..
mkdir -p repositories
cd repositories

function cloneRepo {
    git clone $1
}

function getRepoName {
    if [[ "$1" =~ ([A-Z_a-z-]+)\.git$ ]]; then
        REPO_NAME=${BASH_REMATCH[1]}
    else
        REPO_NAME=""
        >&2 echo "Couldn't decipher the repo name from $1"
        >&2 echo "Tip: it should end with .git for this to work"
    fi
}

function pullRepo {
    getRepoName "$1"
    if [[ ! -z $REPO_NAME ]]; then
        echo "Pulling $REPO_NAME"
        cd $REPO_NAME
        git pull
        cd - > /dev/null
    fi
}

function cloneOrPull {
    getRepoName "$1"
    if [[ -d $REPO_NAME ]]; then
        pullRepo "$1"
    else
        cloneRepo "$1"
    fi
}

function cloneOrPullRepositories {
    for REPOSITORY in $1
    do
        cloneOrPull "$REPOSITORY"
    done
}

cloneOrPullRepositories "$REPOSITORIES"
cd glPortal
git submodule update --recursive --init
cd ..
cd ..
