#!/bin/bash

if [ $# != 6 ]; then
    echo "Usage: ./sh <markdown/text> <context> <corpid> <corpsecret> <agentid> <user>"
    exit 1
    
else

    message_type=$1
    message_content=$2
    CORPID=$3
    CORPSECRET=$4
    AGENT_ID=$5
    USER=$6
    
    access_token=$(curl -s "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$CORPID&corpsecret=$CORPSECRET")
    
    access_token=$(echo $access_token | jq -r '.access_token')
    
    if [ -z "$access_token" ] || [ "$access_token" = "null" ]; then
        echo "Failed to get access_token."
        exit 1
    fi
    
    if [ $message_type = "markdown" ]; then
    curl -s -X POST "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=$access_token" \
         -H 'Content-Type: application/json' \
         -d "{ \
               \"touser\": \"$USER\", \
               \"msgtype\": \"$message_type\", \
               \"agentid\": \"$AGENT_ID\", \
               \"markdown\": {
                 \"content\": \"$message_content\"
               }, \
               \"safe\": 0 \
             }"
    else
    if [ $message_type = "text" ]; then
    curl -s -X POST "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=$access_token" \
         -H 'Content-Type: application/json' \
         -d "{ \
               \"touser\": \"$USER\", \
               \"msgtype\": \"$message_type\", \
               \"agentid\": \"$AGENT_ID\", \
               \"text\": {
                 \"content\": \"$message_content\"
               }, \
               \"safe\": 0 \
             }"
    fi
    fi
    
    if [ $? -eq 0 ]; then
        echo "Message sent successfully."
    else
        echo "Failed to send message."
    fi

fi
