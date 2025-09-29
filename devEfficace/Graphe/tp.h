#ifndef TP_H
#define TP_H
#include <stdio.h>
#include <stdlib.h>

typedef int TypeVal;

typedef enum { 
    PB_GRAPHE, 
    PB_SOMMET_DEJA_EXISTANT, 
    PB_MEMOIRE, 
    PB_SOMMET_INTROUVABLE,
    PB_ARC_DEJA_EXISTANT,
    OK 
} CodeRetour;

typedef enum { FAUX, VRAI } Booleen;

typedef struct CellSommet {
    TypeVal num;
    struct CellSommet *suiv;
    struct CellArc *listArcs;
    Booleen Marque;  // pour les parcours
} Sommet;

typedef struct CellArc {
    Sommet *extremite;
    struct CellArc *suivant;
} Arc;

typedef Sommet * Graphe;

CodeRetour ajouterArc(Graphe h, int dep, int arr);
CodeRetour ajouterSommet(Graphe *ptg, int num);
Sommet* rechercherSommet(Graphe g, int num);
void affichageGraphe(Graphe h);
CodeRetour supprimerSommet(Graphe *ptg, int num);

#endif // TP_H
