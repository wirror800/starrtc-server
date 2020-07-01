#!/bin/bash

git config core.fileMode false || echo "git not installed,continue" #忽ç~U¥æ~V~G件æ~]~Cé~Y~På~O~Xå~L~V
chmod +x supervise.sh supervise

exes=("web" "msgServer" "chatDBServer" "groupServer" "chatRoomServer" "voipServer" "liveSrcServer" "liveVdnServer" "liveProxyServer" "groupPushHttpProxy")

for value in ${exes[@]}
do
    if [[ ! -f supervise.${value} && -f $value ]]; then
        cp -f supervise supervise.${value}
    fi
done

for value in ${exes[@]}
do
    if [ -f $value ]; then
        ./supervise.sh start $value
    fi
done

ps -aux | grep Server
ps -aux | grep groupPushHttpProxy

echo "=================================================================================="
echo "Thanks for your support, Please use the following contact information for feedback"
echo "QQ group: 807242783"
echo "Github: https://github.com/starRTC"
echo "TEL: +86 18612946552"
echo "Enjoy Your Work!"
echo "=================================================================================="
