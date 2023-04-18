#!/bin/bash

if [ $# != 0 ]
then
    echo "Invalid number of arguments (should be 0)"
else
    goaccess $(pwd)/../04/nginx_log_day_*.log --log-format=COMBINED -o report.html
    xdg-open report.html
fi



