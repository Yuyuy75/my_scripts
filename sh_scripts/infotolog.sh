#!/bin/bash

# use sudo before this script!

LOG_FILE=/var/log/misc_logs/mylog

(
date 
who
uptime

) >& $LOG_FILE

