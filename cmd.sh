#!/bin/bash
set -e

if [ "$env" = 'DEV' ]; then
  echo "Running Development Server"
  exec python "identidock.py"
elif [ "$env" = 'UNIT' ]; then
	echo "Runing Unit Tests"
	exec python "/app/tests.py"
else
  echo "Running Production Server"
  exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py \
             --callable app --stats 0.0.0.0:9191
fi