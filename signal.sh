#!/bin/bash

trap 'echo "SIGINT"' SIGINT

trap test_2 SIGTERM

function test_2 () {
    echo "SIGTERM"
}

while true; do
    echo 'sleeping...'
    sleep 1
done
