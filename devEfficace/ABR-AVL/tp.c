#include "tp.h"
#include <stdlib.h>
#include <stdio.h>

Abr creerArbreVide() {
    Abr arbre;
    arbre.racine = NULL;
    return arbre;
}

Booleen estArbreVide(Abr arbre) {
    return (arbre.racine == NULL) ? VRAI : FAUX;
}

Noeud* creerNoeud(int valeur) {
    Noeud* nouveau = (Noeud*)malloc(sizeof(Noeud));
    if (nouveau == NULL) {
        fprintf(stderr, "Erreur d'allocation mémoire\n");
        exit(1);
    }
    nouveau->valeur = valeur;
    nouveau->gauche = NULL;
    nouveau->droit = NULL;
    nouveau->h = 0; // <- ajouter pour les AVL
    return nouveau;
}

void insererFeuille(Abr* arbre, int valeur) {
    Noeud* nouveau = creerNoeud(valeur);
    if (arbre->racine == NULL) {
        arbre->racine = nouveau;
        return;
    }
    Noeud* courant = arbre->racine;
    Noeud* parent = NULL;
    while (courant != NULL) {
        parent = courant;
        if (valeur <= courant->valeur) {
            courant = courant->gauche;
        } else {
            courant = courant->droit;
        }
    }
    if (valeur < parent->valeur) {
        parent->gauche = nouveau;
    } else {
        parent->droit = nouveau;
    }
}

void viderRec(Noeud* n) {
    if (n == NULL) return;
    viderRec(n->gauche);
    viderRec(n->droit);
    free(n);
}

void viderArbre(Abr* arbre) {
    viderRec(arbre->racine);
    arbre->racine = NULL;
}

void parcoursDecroissantRec(Noeud* n) {
    if (n == NULL) return;
    parcoursDecroissantRec(n->droit);
    printf("%d ", n->valeur);
    parcoursDecroissantRec(n->gauche);
}

void afficherDecroissant(Abr arbre) {
    parcoursDecroissantRec(arbre.racine);
    printf("\n");
}

void afficherCoucheRec(Noeud* n, int niveau) {
    if (n == NULL) return;
    afficherCoucheRec(n->droit, niveau + 1);
    for (int i = 0; i < niveau; ++i) printf("    ");
    printf("%d\n", n->valeur);
    afficherCoucheRec(n->gauche, niveau + 1);
}

void afficherCouche(Abr arbre) {
    afficherCoucheRec(arbre.racine, 0);
}

Booleen rechercherValeur(Abr arbre, int valeur) {
    Noeud* courant = arbre.racine;
    while (courant != NULL) {
        if (valeur == courant->valeur) {
            printf("Valeur trouvée: %d\n", valeur);
            return VRAI;
        } else if (valeur < courant->valeur) {
            courant = courant->gauche;
        } else {
            courant = courant->droit;
        }
    }
    printf("Valeur non trouvée: %d\n", valeur);

    return FAUX;
}

// ######################### PARTIE AVL #########################
 int hauteur(Noeud* n) { 
    return n ? n->h : -1; 
}

void mettreAjourHauteur(Noeud* n) {
    if (!n) return ;
    int hg = hauteur(n->gauche);
    int hd = hauteur(n->droit);
    n->h = (hg > hd ? hg : hd) + 1;
}

int getBalance(Noeud* n) {
    return n ? hauteur(n->gauche) - hauteur(n->droit) : 0;
}

Noeud* rotationDroite(Noeud* z) {
    Noeud* y = z->gauche;
    Noeud* T2 = y->droit;
    y->droit = z;
    z->gauche = T2;
    mettreAjourHauteur(z);
    mettreAjourHauteur(y);
    return y;
}

Noeud* rotationGauche(Noeud* z) {
    Noeud* y = z->droit;
    Noeud* T2 = y->gauche;
    y->gauche = z;
    z->droit = T2;
    mettreAjourHauteur(z);
    mettreAjourHauteur(y);
    return y;
}

Noeud* avlRebalance(Noeud* n) {
    mettreAjourHauteur(n);
    int b = getBalance(n);
    if (b > 1) {
        if (getBalance(n->gauche) < 0) n->gauche = rotationGauche(n->gauche); 
        return rotationDroite(n); 
    }
    if (b < -1) {
        if (getBalance(n->droit) > 0) n->droit = rotationDroite(n->droit); 
        return rotationGauche(n); 
    }
    return n;
}

Noeud* avlInsererRec(Noeud* n, int v) {
    if (!n) return creerNoeud(v);
    if (v < n->valeur) n->gauche = avlInsererRec(n->gauche, v);
    else if (v > n->valeur) n->droit = avlInsererRec(n->droit, v);
    else return n; 
    return avlRebalance(n);
}

void avlInserer(Abr* arbre, int valeur) {
    arbre->racine = avlInsererRec(arbre->racine, valeur);
}

Noeud* trouverMin(Noeud* n) {
    while (n && n->gauche) n = n->gauche;
    return n;
}

Noeud* avlSupprimerRec(Noeud* n, int v) {
    if (!n) return NULL;
    if (v < n->valeur) n->gauche = avlSupprimerRec(n->gauche, v);
    else if (v > n->valeur) n->droit = avlSupprimerRec(n->droit, v);
    else {
        if (!n->gauche || !n->droit) {
            Noeud* enfant = n->gauche ? n->gauche : n->droit;
            free(n);
            return enfant;
        } else {
            Noeud* succ = trouverMin(n->droit);
            n->valeur = succ->valeur;
            n->droit = avlSupprimerRec(n->droit, succ->valeur);
        }
    }
    return avlRebalance(n);
}

void avlSupprimer(Abr* arbre, int valeur) {
    arbre->racine = avlSupprimerRec(arbre->racine, valeur);
}
