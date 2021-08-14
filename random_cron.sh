#!/bin/zsh

sed -i '/cron:/d' .github/workflows/run.yml

if [[ $(date '+%H') == 00 ]];then
    time=$(($RANDOM%10))" 2 * * *"
elif [[ $(date '+%H') == 02 ]];then
    time=$(($RANDOM%10))" 4 * * *"
elif [[ $(date '+%H') == 04 ]];then
    time=$(($RANDOM%10))" 6 * * *"
elif [[ $(date '+%H') == 06 ]];then
    time=$(($RANDOM%10))" 8 * * *"
elif [[ $(date '+%H') == 08 ]];then
    time=$(($RANDOM%10))" 10 * * *"
elif [[ $(date '+%H') == 10 ]];then
    time=$(($RANDOM%5))" 13 * * *"
elif [[ $(date '+%H') == 13 ]];then
    time=$(($RANDOM%10))" 0 * * *"
else
    time=$(($RANDOM%10))" 0,2,4,6,8,10,13 * * *"
fi
echo 当前时间为$(date '+%H')时，计划运行时间$time
sed -i '/schedule/a\    - cron: '$time'' .github/workflows/run.yml

exit 0
