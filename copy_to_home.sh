#!/usr/bin/env bash
find . -maxdepth 1 -type f -name ".*" | xargs -I {} cp {} ~/
