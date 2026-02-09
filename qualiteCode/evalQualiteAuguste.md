Fleury Auguste PM4
04/02/26
######################

# Q1

Le garbage collector est utilisé une 1 fois on le vois de manière clair dans un premier temps sur le graphique de droite au timing x = 10:56:00 avec le "Relative time spent in GC"
 qui augment légérement au timing x et aussi grâce au petit saut de "Used heap dans le graphique de gauche. 

# Q2

Lors du TP, il n'y avait pas de fuite mémoire quand la liste était déclarée localement dans la méthode, car elle était automatiquement libérée à la fin de la méthode. 
Par ce que ma mémoire utilisée par la liste était récupéré et et donc plus d'accumulation d'objet inutilisé 

# Q3

Une fuite mémoire, c'est lorsqu’un programme/processus ne libere pas la mémoire qu’il a alloué et qu’il n’en a plus besoin. 
Cela entraîne une augmentation progressive de la mémoire  et ça peut entrainer un épuisement de la mémoire et/ou un crash du programme