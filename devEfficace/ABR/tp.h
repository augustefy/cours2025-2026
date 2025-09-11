#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#ifndef TP_H
#define TP_H

typedef struct Noeud {
    int valeur;
    struct Noeud* gauche;
    struct Noeud* droit;
} Noeud;

typedef struct {
    Noeud* racine;
} Abr;

Abr creerArbreVide();

bool estArbreVide(Abr arbre);


#endif // TP_H