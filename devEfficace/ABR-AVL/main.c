#include "tp.h"
#include <stdio.h>

static void afficherInfixeAvecHauteurs(Noeud* n) {
    if (!n) return;
    afficherInfixeAvecHauteurs(n->gauche);
    printf("%d(h=%d,b=%d) ", n->valeur, n->h, getBalance(n));
    afficherInfixeAvecHauteurs(n->droit);
}

static int verifierAvlOk(Noeud* n) {
    if (!n) return 1;
    int b = getBalance(n);
    if (b < -1 || b > 1) return 0;
    return verifierAvlOk(n->gauche) && verifierAvlOk(n->droit);
}

static void afficherTout(const char* titre, Abr a) {
    printf("\n== %s ==\n", titre);
    printf("Couche:\n");
    afficherCouche(a);
    printf("Infixe (valeurs, hauteurs, balances): ");
    afficherInfixeAvecHauteurs(a.racine);
    printf("\nHauteur(racine)=%d, Balance(racine)=%d, AVL_ok=%s\n",
           a.racine ? a.racine->h : -1,
           a.racine ? getBalance(a.racine) : 0,
           verifierAvlOk(a.racine) ? "oui" : "non");
}

int main(void) {
    Abr a = creerArbreVide();

    avlInserer(&a, 30);
    avlInserer(&a, 20);
    avlInserer(&a, 10);
    afficherTout("Après LL (30,20,10)", a);

    viderArbre(&a);

//######################### reset #########################

    avlInserer(&a, 10);
    avlInserer(&a, 20);
    avlInserer(&a, 30);
    afficherTout("Après RR (10,20,30)", a);

    viderArbre(&a);

    avlInserer(&a, 30);
    avlInserer(&a, 10);
    avlInserer(&a, 20);

    afficherTout("Après LR (30,10,20)", a);
    viderArbre(&a);

    avlInserer(&a, 10);
    avlInserer(&a, 30);
    avlInserer(&a, 20);
    afficherTout("Après RL (10,30,20)", a);

    viderArbre(&a);

//######################### reset #########################


    int valeurs[] = {30, 20, 40, 10, 25, 22, 50, 5, 28, 35, 60};
    size_t n = sizeof(valeurs)/sizeof(valeurs[0]);
    for (size_t i = 0; i < n; ++i) avlInserer(&a, valeurs[i]);
    afficherTout("Après insertions multiples", a);
    printf("Recherche 22: %s\n", rechercherValeur(a, 22) ? "trouvée" : "non trouvée");

    printf("Recherche 99: %s\n", rechercherValeur(a, 99) ? "trouvée" : "non trouvée");

    avlSupprimer(&a, 50); 
    afficherTout("Après suppression 50", a);

    avlSupprimer(&a, 20); 

    afficherTout("Après suppression 20", a);

    avlSupprimer(&a, 30); //racine 
    afficherTout("Après suppression 30 (ancienne racine)", a);

    viderArbre(&a);

//######################### reset #########################

    return 0;
}
