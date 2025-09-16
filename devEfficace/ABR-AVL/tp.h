#ifndef TP_H
#define TP_H

typedef struct Noeud {
    int valeur;
    struct Noeud* gauche;
    struct Noeud* droit;
    int h;              
} Noeud;

typedef struct {
    Noeud* racine;
} Abr; 

typedef enum { FAUX, VRAI } Booleen;


Abr creerArbreVide();

Booleen estArbreVide(Abr arbre);

Noeud* creerNoeud(int valeur); 


void insererFeuille(Abr* arbre, int valeur);

void viderArbre(Abr* arbre);

void viderRec(Noeud* n);

void parcoursDecroissantRec(Noeud* n);


void afficherDecroissant(Abr arbre);


void afficherCoucheRec(Noeud* n, int niveau);

void afficherCouche(Abr arbre);

Booleen rechercherValeur(Abr arbre, int valeur);

int hauteur(Noeud* n);

void mettreAjourHauteur(Noeud* n);

int getBalance(Noeud* n);

Noeud* rotationDroite(Noeud* z);

Noeud* rotationGauche(Noeud* z);

Noeud* avlRebalance(Noeud* n);

Noeud* avlInsererRec(Noeud* n, int v);

void avlInserer(Abr* arbre, int valeur);

void avlSupprimer(Abr* arbre, int valeur);

#endif // TP_H