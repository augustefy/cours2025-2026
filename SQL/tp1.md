# TP de rappel de 1ere année 

#### Q2) Dans quelle ville est située l’équipe surnommée les Grizzlies ? 

TP=# Select t.city from team t where lower(t.nickname) = 'grizzlies';  
city   
/---------/  
 Memphis  
(1 row)  
Alors visiblement laville associé a l'équipe des Grizzlies est la ville de memphis  

Select t.city from team t where lower(t.nickname) = 'grizzlies';
<br/>
<br/>
#### Q3) Quel est le plus gros score marqué à domicile par une équipe?
 
TP=# Select max(ptshome) from game;  
 max   
/-----/  
 168  
(1 row)  

Visiblement le nombre maximum de poit marqué chez soi est de 168 point


#### Q4) Quel est le plus gros score marqué à l’extérieur par une équipe?

TP=# Select max(ptsaway) from game;  
 max   
/-----/  
 168  
(1 row)  

Visiblement le maximum de point marqué à l'extérieru est le meme que celui marqué cheze soi, soit un total de 168 poinr 


#### Q5) Le résultat obtenu devrait être surprenant. Justifier que vos réponses aux deux dernières questions sont correctes.


On constate que :
	•	Le score maximal à domicile est 168 points.
	•	Le score maximal à l’extérieur est également 168 points.
C'est pas une erreur de donné juste une coïncidence des données présentes dans la base. On peut le voir grace à :  

SELECT dateGame
FROM Game  
WHERE ptsAway = ( SELECT max( ptsAway )  
FROM Game );  
dategame  
/------------/  
2019-03-01  
(1 ligne)  


SELECT dateGame  
FROM Game  
WHERE ptsHome = ( SELECT max( ptsHome )  
FROM Game );  
dategame  
/------------/  
2008-03-16  
(1 ligne)  


#### Q6) Quelle équipe a marqué le plus de points à domicile, indiquez l’abbréviation, le nickname, la ville, les points marqués et la date du match ?

SELECT t. abbreviation , t. nickname , t.city , g. ptsHome , g. dateGame  
FROM Game g JOIN Team t ON t.id = g. idHomeTeam  
WHERE g. ptsHome = ( SELECT max( ptsHome )  
FROM Game );  
abbreviation | nickname | city | ptshome | dategame  
/--------------+----------+--------+---------+------------/  
DEN | Nuggets | Denver | 168 | 2008-03-16  
(1 ligne)


#### Q7) Même question à l’extérieur.  
SELECT t. abbreviation , t. nickname , t.city , g. ptsAway , g. dateGame  
FROM Game g JOIN Team t ON t.id = g. idVisitorTeam  
WHERE g. ptsAway = ( SELECT max( ptsAway )  
FROM Game );  
abbreviation | nickname | city | ptsaway | dategame  
/--------------+----------+---------+---------+------------/   
CHI | Bulls | Chicago | 168 | 2019-03-01  
(1 ligne)  

#### Q8) Quels sont les noms des joueurs qui ont le plus gros pourcentage de paniers à trois points dans un match?
SELECT DISTINCT p.*, gd. threePointsPrctage  
FROM Player p JOIN GameDetail gd ON p.id = gd. idPlayer  
WHERE gd. threePointsPrctage IS NOT NULL  
AND gd. threePointsPrctage = ( SELECT max( threePointsPrctage )  
FROM GameDetail ); 
id | name | country | threepointsprctage
/---------+--------------------------+------------------------+--------------------/ 
204067 | Jarell Eddie | USA | 1  
1630186 | Jahmi’us Ramsey | USA | 1  
203458 | Alex Len | Ukraine | 1  
etc ...
(1589 lignes)  


#### Q9) Quels sont les joueurs qui ont la moyenne la plus élevée de pourcentage de paniers à trois points sur tous les matchs?

SELECT p.id , p.name , avg(gd. threePointsPrctage )  
FROM Player p JOIN GameDetail gd ON p.id = gd. idPlayer  
WHERE gd. threePointsPrctage IS NOT NULL  
GROUP BY p.id , p. name  
HAVING avg(gd. threePointsPrctage ) >=ALL (  
SELECT avg(gd2. threePointsPrctage )   
FROM GameDetail gd2  
WHERE gd2. threePointsPrctage IS NOT NULL  
GROUP BY gd2. idPlayer );  
id | name | avg  
/---------+---------------------+------------------------/  
1628491 | Derek Willis | 1.00000000000000000000  
2650 | Demetrius Alexander | 1.00000000000000000000  
204026 | Brock Motum | 1.00000000000000000000  
(9 lignes)  

#### Q10) Pour la saison 2012, calculer quel est le plus grand nombre de paniers à 3 points marqués par un joueur.

TP=# SELECT max(s.sum)  
FROM ( SELECT sum( threePointsMade )  
FROM Game g JOIN GameDetail gd ON g.id = gd. idGame  
WHERE g. season = 2012  
GROUP BY gd. idPlayer ) s;  
 max  
/-----/  
 320  
(1 row) 

#### Q11) Pour chaque conférence, quelle équipe (nom et ville) est la dernière à avoir rejoint la NBA en indiquant l’année d’arrivée en NBA?

SELECT t1. conference , t1. nickname , t1.city , t1. minYear
FROM Team t1
WHERE t1. minYear = ( SELECT max(t2. minYear )
FROM Team t2
WHERE t1. conference =t2. conference );
conference | nickname | city | minyear
------------+----------+-------------+---------
W | Pelicans | New Orleans | 2002
E | Raptors | Toronto | 1995  
(2 lignes) 


#### Q12)Quel est le nom du joueur qui a fait le plus de passes décisives dans un match? Donner la date de son exploit

SELECT name , assists , dateGame  
FROM Gamedetail gd JOIN Player p ON gd. idPlayer = p.id  
JOIN Game g ON gd. idGame = g.id  
WHERE assists = ( SELECT max( assists )  
FROM Gamedetail );  
name | assists | dategame  
-------------+---------+------------  
Rajon Rondo | 25 | 2017-12-27  
(1 lignes)  
