#!/usr/bin/bash

. ~/sh/CSWSException.sh

# �����̳� ������ �� �̰͵� csws���� ����Ǿ�� �Ѵ�.
SendPublickey()
{
    local hostName=$1 # ����� ���� �̸�
    local hostIp=$2 # ����� ���� IP �ּ�
    local conName=$3
    local keyName=$4

    ssh $hostName@$hostIp "mkdir Keys"
    scp ~/Keys/$hostName/$keyName.pub $hostName@$hostIp:~/Keys/ 
    ssh $hostName@$hostIp "sh H_SendPublickey.sh $keyName $conName"
}
Start SendPublickey
SendPublickey $1 $2 $3 $4 && CSWSSuccess SendPublickey || CSWSFailure SendPublickey