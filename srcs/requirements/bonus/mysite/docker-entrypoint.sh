#!/bin/sh

npm install next react react-dom
npm install --production

exec "$@"