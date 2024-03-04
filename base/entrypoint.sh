#!/usr/bin/env bash

cleanup() {
    echo "Exiting..."
    exit
}

trap cleanup INT TERM

service ssh start
service cron start

echo Challenge started !

while :; do
    sleep 1s
done
