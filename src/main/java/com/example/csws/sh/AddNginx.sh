#!/usr/bin/bash

AddNginx()
{
    local serviceName=$1 # ���� �̸�
    local domainName=$2 ## aimyon.com (www ����)
    local port=$3 # ��Ʈ������ �� ��Ʈ
    local ip=$4 # ������... �� ������ ������

    # �μ��� �� ���Դ��� Ȯ��
    if [ $# -lt 4 ]; then
        echo "3" #�μ��� �����մϴ�.
        exit 1
    fi

    ## �̹� ��� ���� ���� �̸��Դϴ�

    if [ -f /etc/nginx/conf.d/$serviceName.conf ]; then
        echo "�̹� ��� ���� ���� �̸��Դϴ�." 
        exit 1
    fi

    sudo cp ~/sh/nginxTemplet /etc/nginx/conf.d/$serviceName.conf

    ## ������ �߰� �۾�
    sudo sed -ri "s/.*server_name/\tserver_name $domainName www.$domainName;/g" /etc/nginx/conf.d/$serviceName.conf
    sudo sed -ri "s/.*proxy_pass/\tproxy_pass http:\/\/$ip:$port;/g" /etc/nginx/conf.d/$serviceName.conf

    sudo nginx -s reload
}

AddNginx $1 $2 $3 $4