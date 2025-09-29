#include "tp.h"

int main(void) {

    printf("Hello, World!\n");
    Graphe g = NULL;

    printf("#########################################Ajout des sommets 1, 2, 3, 4, 5#########################################\n");
    ajouterSommet(&g, 1);
    ajouterSommet(&g, 2);
    ajouterSommet(&g, 3);
    ajouterSommet(&g, 4);
    ajouterSommet(&g, 5);

    printf("#########################################Ajout des arcs pour un beau graphe :#########################################\n");
    ajouterArc(g, 1, 2);
    ajouterArc(g, 1, 3);
    ajouterArc(g, 2, 3);
    ajouterArc(g, 2, 4);
    ajouterArc(g, 3, 4);
    ajouterArc(g, 4, 5);
    ajouterArc(g, 5, 1);
    ajouterArc(g, 3, 5);

    printf("#########################################Affichage du graphe :#########################################\n");
    affichageGraphe(g);

    printf("#########################################Test d'ajout d'un sommet déjà existant (1)#########################################\n");
    CodeRetour cr = ajouterSommet(&g, 1);
    if (cr == PB_SOMMET_DEJA_EXISTANT) {
        printf("Sommet déjà existant détecté correctement.\n");
    }

    printf("#########################################Test d'ajout d'un arc déjà existant (1->2)#########################################\n");
    cr = ajouterArc(g, 1, 2);
    if (cr == PB_ARC_DEJA_EXISTANT) {
        printf("Arc déjà existant détecté correctement.\n");
    }

    printf("#########################################Recherche du sommet 2 :#########################################\n");
    Sommet* s = rechercherSommet(g, 2);
    if (s != NULL) {
        printf("Sommet 2 trouvé.\n");
    } else {
        printf("Sommet 2 non trouvé.\n");
    }

    return 0;
}
