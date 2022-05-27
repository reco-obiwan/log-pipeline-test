#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

if [[ "$1" = "serve" ]]; then
    shift 1
    gunicorn main:app --log-level=warning -w 2 -b 0.0.0.0:80 -k uvicorn.workers.UvicornWorker
elif [[ "$1" = "debug" ]]; then
    python main.py
else
    eval "$@"
fi

# prevent docker exit
tail -f /dev/null