# Cryptographie — TD1 (développement niveau Terminale)
_Source : TD1 Arithmétique et chiffrement_  [oai_citation:1‡TD1-Rappel-historique.pdf](sediment://file_000000003684720a86aaf8b3f1ef052e)

---

## Exercice 1 — Divisions euclidiennes

```text
Méthode :
Une division euclidienne, c’est écrire a = bq + r avec 0 ≤ r < b.
Donc on cherche le plus grand multiple de b inférieur ou égal à a.

1) 43 ÷ 12
12×3 = 36 et 12×4 = 48 (trop grand), donc q = 3.
r = 43 − 36 = 7.
=> 43 = 12×3 + 7.

2) 87 ÷ 9
9×9 = 81 et 9×10 = 90 (trop grand), donc q = 9.
r = 87 − 81 = 6.
=> 87 = 9×9 + 6.


```

## Exercice 2 
```text
1) Tables de multiplication

Dans Z/nZ, on multiplie “normalement” puis on prend le reste modulo n.

Table dans Z/6Z (résultats mod 6) :
× | 0 1 2 3 4 5
--+------------
0 | 0 0 0 0 0 0
1 | 0 1 2 3 4 5
2 | 0 2 4 0 2 4
3 | 0 3 0 3 0 3
4 | 0 4 2 0 4 2
5 | 0 5 4 3 2 1

Table dans Z/7Z (résultats mod 7) :
× | 0 1 2 3 4 5 6
--+----------------
0 | 0 0 0 0 0 0 0
1 | 0 1 2 3 4 5 6
2 | 0 2 4 6 1 3 5
3 | 0 3 6 2 5 1 4
4 | 0 4 1 5 2 6 3
5 | 0 5 3 1 6 4 2
6 | 0 6 5 4 3 2 1


2a) Résoudre dans Z/6Z

i) 5x = 4 (mod 6)
On teste x = 0..5 :
5×0=0, 5×1=5, 5×2=10≡4 ✅
=> x ≡ 2 (mod 6).

ii) 2x = 4 (mod 6)
2×2 = 4 ✅ donc x ≡ 2 marche.
Mais attention : modulo 6, 2 n’est pas inversible (pgcd(2,6)=2), donc parfois plusieurs solutions.
On teste : x=5 donne 2×5=10≡4 ✅ aussi.
=> solutions : x ≡ 2 ou 5 (mod 6).

iii) 2x = 5 (mod 6)
2×0=0, 2×1=2, 2×2=4, 2×3=0, 2×4=2, 2×5=4 : jamais 5.
=> aucune solution dans Z/6Z.

2b) Même questions dans Z/7Z

Comme 7 est premier, tout nombre non nul est inversible : il y aura une unique solution.

i) 5x = 4 (mod 7)
On cherche l’inverse de 5 mod 7 : 5×3=15≡1, donc 5^{-1}≡3.
=> x ≡ 3×4 = 12 ≡ 5 (mod 7).

ii) 2x = 4 (mod 7)
Inverse de 2 mod 7 : 2×4=8≡1, donc 2^{-1}≡4.
=> x ≡ 4×4 = 16 ≡ 2 (mod 7).

iii) 2x = 5 (mod 7)
=> x ≡ 4×5 = 20 ≡ 6 (mod 7).

```

## Exercice 3) 
Définition :
L’inverse de a modulo 7 est le nombre a^{-1} tel que a·a^{-1} ≡ 1 (mod 7).

• Inverse de 3 mod 7 :
3×5 = 15 ≡ 1 (car 15 = 14 + 1)
=> 3^{-1} ≡ 5 (mod 7)

• Inverse de 4 mod 7 :
4×2 = 8 ≡ 1 (car 8 = 7 + 1)
=> 4^{-1} ≡ 2 (mod 7)

## Exercice 4 

```text
Rappel :
a est inversible modulo n ssi pgcd(a,n)=1.
Avec Euclide étendu, on écrit : au + nv = 1
Alors u est l’inverse de a modulo n.

1) Inverse de 5 dans Z/26Z
pgcd(5,26)=1 donc inverse existe.
26 = 5×5 + 1
=> 1 = 26 − 5×5
Donc 5×(-5) + 26×1 = 1
=> inverse de 5 mod 26 : -5 ≡ 21 (mod 26)

Réponse : 5^{-1} ≡ 21 (mod 26).

2) Inverse de 22 dans Z/79Z
Euclide :
79 = 22×3 + 13
22 = 13×1 + 9
13 = 9×1 + 4
9  = 4×2 + 1
Remontée :
1 = 9 − 4×2
4 = 13 − 9×1
=> 1 = 9 − (13 − 9)×2 = 3×9 − 2×13
9 = 22 − 13×1
=> 1 = 3×(22 − 13) − 2×13 = 3×22 − 5×13
13 = 79 − 22×3
=> 1 = 3×22 − 5×(79 − 22×3) = 18×22 − 5×79
Donc 22×18 ≡ 1 (mod 79).

Réponse : 22^{-1} ≡ 18 (mod 79).

3) Inverse de 441 dans Z/777Z
Euclide :
777 = 441×1 + 336
441 = 336×1 + 105
336 = 105×3 + 21
105 = 21×5 + 0
Donc pgcd(441,777)=21 ≠ 1
=> pas d’inverse.

Réponse : 441 n’est pas inversible modulo 777.

```

## Exercice 5 

```text 
On cherche x tel que :
x ≡ 1 (mod 3)
x ≡ 2 (mod 5)
x ≡ 3 (mod 7)

Méthode simple (niveau lycée) : tester les nombres qui vérifient une congruence puis filtrer.

Comme x ≡ 3 (mod 7), on écrit x = 3 + 7k.

On veut aussi x ≡ 2 (mod 5) :
3 + 7k ≡ 2 (mod 5)
7k ≡ -1 (mod 5)
7 ≡ 2 (mod 5) donc 2k ≡ 4 (mod 5)
Inverse de 2 mod 5 : 3 (car 2×3=6≡1)
=> k ≡ 3×4 = 12 ≡ 2 (mod 5)

Donc k = 2 + 5t
=> x = 3 + 7(2+5t) = 17 + 35t

On impose x ≡ 1 (mod 3) :
17 + 35t ≡ 1 (mod 3)
17 ≡ 2, 35 ≡ 2 (mod 3)
=> 2 + 2t ≡ 1 (mod 3)
2t ≡ -1 ≡ 2 (mod 3)
Inverse de 2 mod 3 : 2
=> t ≡ 2×2 = 4 ≡ 1 (mod 3)

Donc t = 1 + 3s
=> x = 17 + 35(1+3s) = 52 + 105s

Plus petit positif : x = 52.
```

## Exercice 6




