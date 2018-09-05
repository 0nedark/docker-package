#!/usr/bin/env bash

git checkout -b temp_build
if [ -f /app/bin/build ]; then
    /app/bin/build
fi
git add -A
git commit -m "Build"