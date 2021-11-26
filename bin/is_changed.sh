#!/bin/bash

if [ "${CIRCLE_BRANCH}" = "main" ]; then
  DIFF_TARGET="HEAD^ HEAD"
else
  DIFF_TARGET="origin/main"
fi

DIFF_FILES=(`git diff ${DIFF_TARGET} --name-only --relative=${1}`)

if [ ${#DIFF_FILES[@]} -eq 0 ]; then
  exit 1
else
  exit 0
fi