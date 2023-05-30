#!/usr/bin/bash

. ~/sh/Exception.sh

PrintIPforUser()
{
    local hostName=$1
    local hostIp=$2 
    
    local userName=$3 # �����̳ʸ� �����Ų ���� �̸�

    ssh $hostName@$hostIp "sh sh/H_PrintIPforUser.sh $userName"    
}
Start PrintIPforUser
PrintIPforUser $1 $2 $3 && CSWSSuccess PrintIPforUser || CSWSFailure PrintIPforUser