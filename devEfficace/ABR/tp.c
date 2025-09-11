#include "tp.h"


Abr creerArbreVide() {
    Abr arbre;
    arbre.racine = NULL;
    return arbre;
}

bool estArbreVide(Abr arbre) {
    return arbre.racine == NULL;
}

