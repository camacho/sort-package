#!/usr/bin/env bash

STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep "js$")
if [[ "$STAGED_FILES" = "" ]]; then
    exit 0
fi

STAGED_FILES=$(echo "$STAGED_FILES" | tr '\r\n' ' ')

set -eux;

jest --bail --passWithNoTests --findRelatedTests $STAGED_FILES
