#!/usr/bin/bash

. ~/sh/Exception.sh

StartContainer()
{
    local hostName=$1
    local hostIp=$2 
    
    # ������ ������ ��Ŀ �����̳� �̸�
    local containerName=$3

    ssh $hostName@$hostIp "sh sh/H_StartContainer.sh $containerName"    
}
Start StartContainer
StartContainer $1 $2 $3 && CSWSSuccess StartContainer || CSWSFailure StartContainer