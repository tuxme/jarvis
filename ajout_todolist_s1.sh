#!/bin/bash

[[ -f /tmp/todolist_name ]] && rm -f /tmp/todolist_name

echo "$1" > /tmp/todolist_name




