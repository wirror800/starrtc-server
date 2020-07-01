#!/bin/bash

exes=("msgServer" "chatDBServer" "groupServer" "chatRoomServer" "voipServer" "liveSrcServer" "liveVdnServer" "liveProxyServer" "groupPushHttpProxy" "web")

for value in ${exes[@]}
do
    if [ -f $value ]; then
        ./supervise.sh stop $value
    fi
done

ps -aux | grep Server
ps -aux | grep groupPushHttpProxy
