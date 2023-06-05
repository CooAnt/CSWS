#!/usr/bin/bash

DeleteNginx()
{
    local serviceName=$1

    ## �����Ϸ��� �ϴ� ���񽺰� �����ϴ�.

    if [ ! -f /etc/nginx/conf.d/$serviceName.conf ]; then
        echo "�����Ϸ��� �ϴ� ���񽺰� �����ϴ�." 
        exit 1
    fi

    sudo rm /etc/nginx/conf.d/$1.conf
    nginx -s reload
}

DeleteNginx $1