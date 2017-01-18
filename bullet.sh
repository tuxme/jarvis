#!/bin/bash

    title="$1"
    text="$2"

    if [[ -z "$2" ]]
        then
                echo -e "\n----------- NO DATA --------- "
                title=`hostname`
                text="$1"
    fi
    curl -u [API KEY Pushbullet]: https://api.pushbullet.com/v2/pushes -d type=note -d title="$title" -d body="$text"
