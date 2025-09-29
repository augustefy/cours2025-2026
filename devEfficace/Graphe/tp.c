#include "tp.h"

void affichageGraphe(Graphe h){
    Sommet* p = h;
    while (p != NULL){
        printf("%d :\n", p->num);
        Arc* arc = p->listArcs;
        while (arc != NULL) {
            printf("\t-> %d\n", arc->extremite->num);
            arc = arc->suivant;
        }
        p = p->suiv;
    }
}


CodeRetour ajouterSommet(Graphe *ptg, int num){
    if (ptg == NULL) return PB_GRAPHE; 
    if (rechercherSommet(*ptg, num) != NULL) return PB_SOMMET_DEJA_EXISTANT;

    Sommet *nv = (Sommet*)malloc(sizeof(Sommet));
    if (nv == NULL) return PB_MEMOIRE;
    nv->num = num;
    nv->listArcs = NULL;
    nv->suiv = *ptg; 
    *ptg = nv;
    return OK;
}

CodeRetour ajouterArc(Graphe h, int dep, int arr){
    if (h == NULL) return PB_GRAPHE;
    Sommet* sDep = rechercherSommet(h, dep);
    Sommet* sArr = rechercherSommet(h, arr);
    if (sDep == NULL || sArr == NULL) return PB_SOMMET_INTROUVABLE;

    Arc* cur = sDep->listArcs;
    while (cur != NULL) {
        if (cur->extremite == sArr) { 
            return PB_ARC_DEJA_EXISTANT;
        }
        cur = cur->suivant;
    }


    Arc* nv = (Arc*)malloc(sizeof(Arc));
    if (nv == NULL) return PB_MEMOIRE;
    nv->extremite = sArr;
    nv->suivant = sDep->listArcs;
    sDep->listArcs = nv;

    return OK;  
}




Sommet* rechercherSommet(Graphe g, int num){
    Sommet* p = g;
    while (p != NULL){
        if (p->num == num) return p;
        p = p->suiv;
    }
    return NULL;
}

CodeRetour supprimerSommet(Graphe *ptg, int num){
    if (ptg == NULL) return PB_GRAPHE;
    if (rechercherSommet(*ptg, num) == NULL) return PB_SOMMET_INTROUVABLE;

    Sommet* p = *ptg;
    while (p != NULL){
        if (p->num == num) {
            Arc* arc = p->listArcs;
            Arc* prev = NULL;
            while (arc != NULL){
                free(prev);
                arc = arc->suivant;
                prev->suivant = arc;
                prev = arc;
                arc = arc->suivant;
                free(arc);
            }
            free(p);
            return OK;
        }
        p = p->suiv;
    }
    return PB_SOMMET_INTROUVABLE;
}
