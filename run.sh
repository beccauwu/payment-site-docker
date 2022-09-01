#!/bin/bash
echo "choose a number"
echo "> 1: build"
echo "> 2: maintenance"
echo "> 3: configure environment"
echo "> 4: restore database"
read num
case $num in
    1)
        echo "running build..."
        source bin/build.sh
        ;;
    2)
        echo "running maintenance..."
        source bin/maintenance.sh
        ;;
    3)
        echo "running config..."
        source bin/config.sh
        ;;
    4)
        echo "running restore database..."
        source bin/db_restore.sh
        ;;
esac
