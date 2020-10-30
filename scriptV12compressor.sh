
#!/bin/bash
> route.dot
> route.txt


echo "  _______ _____            _____ ______ _____   ____  _    _ _______ ______ "
echo " |__   __|  __ \     /\   / ____|  ____|  __ \ / __ \| |  | |__   __|  ____|"
echo "    | |  | |__) |   /  \ | |    | |__  | |__) | |  | | |  | |  | |  | |__   "
echo "    | |  |  _  /   / /\ \| |    |  __| |  _  /| |  | | |  | |  | |  |  __|  "
echo "    | |  | | \ \  / ____ \ |____| |____| | \ \| |__| | |__| |  | |  | |____ "
echo "    |_|  |_|  \_\/_/    \_\_____|______|_|  \_\\\____/ \____/   |_|  |______|"
echo "                                                                            "

rm $2.rte
protocoles=("-T -p 80" "-T -p 22" "-I" "-T -p 443" "-U -p 33434" "-U -p 5060" "-U -p 1194" "fin")

ip=$(traceroute -n "$1" | head -n 1 | awk -F "[()]" '{print $2}')

echo "Chemin pour aller vers : $1"
echo "-----------------------------------: $ip :---------------------------------------------"

	for ((TTL=1;TTL<30;TTL++));
	do
		for jul in "${protocoles[@]}"
 		do
			if [[ "$jul" == "fin" ]]
			then 
			echo "erreur, en essayant tous les protocoles nous n'avons pas pu trouver une route disponible vers $d"
			echo "\"$route\" -> " >> route.dot
			echo "\"$route\" -> " >> $2.rte 
			break 3
			else

            		route=$(traceroute $jul -n -m $TTL -f $TTL -q 1 $1 | awk '{print $2}' | tail -n 1)
			#echo $jul
				if [ "$route" == "*" ]; 
					then
					echo "ta grand mere"
					continue
					else
						if [ "$route" == "$ip" ];
                                		then
						echo "$route"
                     				echo "\"$route $1\" ;" >> route.dot
						echo "\"$route\" ;" >> $2.rte 
                                		break 2
                                		else 

 
 
					echo $route
					echo "\"$route\" -> " >> route.dot 
					echo "\"$route\" -> " >> $2.rte
					break 
	

			fi	
				fi
					fi

		done
done


