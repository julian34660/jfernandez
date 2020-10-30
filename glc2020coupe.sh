rm route.dot                                                            #ça nous permet de supprimer le fichier route.dot
echo digraph traceroute { >>route.dot                                   #On echo digraph afin de construire le graphe
cat $@ >>route.dot
echo "}" >>route.dot 
dot -Tpdf route.dot -o route.pdf                                        #on construit le fichier pdf à partir du fichier .dot
