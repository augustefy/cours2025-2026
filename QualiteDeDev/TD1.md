# TD1 
## Exercice 1 

methode java : 

```java 
    String typeTriangle(int a, int b, int c)

```

### Jeu d’essais – `typeTriangle(int a, int b, int c)`

| Type de cas | Valeur d’entrée (a, b, c) | Valeur de retour attendue |
|------------|---------------------------|---------------------------|
| Triangle équilatéral | (5, 5, 5) | "Equilateral" |
| Triangle isocèle (a=b) | (5, 5, 3) | "Isosceles" |
| Triangle isocèle (a=c) | (5, 3, 5) | "Isosceles" |
| Triangle isocèle (b=c) | (3, 5, 5) | "Isosceles" |
| Triangle scalène | (4, 5, 6) | "Scalene" |
| Limite inégalité triangulaire | (1, 2, 3) | "NotATriangle" |
| Pas un triangle | (2, 2, 5) | "NotATriangle" |
| Valeur nulle | (0, 4, 5) | "Invalid" |
| Valeur négative | (-1, 4, 5) | "Invalid" |
| Toutes valeurs négatives | (-3, -3, -3) | "Invalid" |