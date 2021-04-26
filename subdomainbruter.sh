#!/bin/bash
#Credits to Numa Ciberseguridad
clear
figlet subdomainbrute 
echo "========================================================================"
echo "========================Credits : Numa Ciberseguridad========================"
echo -e "\n"
echo -e "\t\e[1;33mEnter URL :==>>"
read url 
echo "======================================================"
echo -e "\n Bruter Started....\n"
filename="word.txt"
while read -r in
do
status=`curl -Is http://$in.$url | head -1| cut -d $' ' -f2` 
 if [ "$status" == "200" ] || [ "$status" == "301" ] || [ "$status" == "302" ] || [ "$status" == "303" ] || [ "$status" == "400" ] || [ "$status" == "401" ] || [ "$status" == "402" ] || [ "$status" == "403" ] 
|| [ "$status" == "404" ] || [ "$status" == "405" ] || [ "$status" == "406" ] || [ "$status" == "500" ] || [ "$status" == "501" ] || [ "$status" == "502" ] 
       then
 echo -e "\t$in.$url -> $status"
else 
 echo -e "\t$in.$url -> Doesnot Exist"	
fi
done < "$filename"
echo -e "\n Done"
