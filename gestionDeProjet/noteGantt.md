# Notes sur la planification GanttProject pour SAÉ

## Problème identifié

Avec les SAÉ, on n'est pas en "7h par jour" classique, mais en petits créneaux dispersés (mardi 8–10, vacances, heures FI, etc.). Si on cale 7h/jour dans GanttProject, le planning ne ressemble plus à la réalité.

## Solution : Convention de planification

### Idée clé

**1 "jour" Gantt = 1 créneau SAÉ de 2h**

Le plus petit bloc "stable" dans les consignes c'est 2h (mardi 8h–10h, ou blocs de 6h qui font 3×2h).

### Convention

**1 "jour de travail" dans GanttProject = 2h de SAÉ**

### Conversion des estimations

**Formule :** `nb de "jours Gantt" = heures estimées ÷ 2`

**Exemples :**
- Une tâche estimée à 8h = 4 "jours" dans GanttProject
- Une tâche estimée à 15h → 7,5 "jours" → **8 jours** (arrondir vers le haut)
- Une tâche estimée à 30h = 15 "jours"
- Une tâche estimée à 42h = 21 "jours"

**Règle importante :** Toujours arrondir vers le haut pour ne pas se mettre en retard.

## Configuration dans GanttProject

### 1. Créer un calendrier "SAE"

1. Menu **Projet → Propriétés → Calendrier**
2. Dupliquer le calendrier de base pour créer "Calendrier SAÉ 2h"
3. Dans ce calendrier :
   - Mettre tous les jours ouvrables en non travaillés (si strict)
   - Ou garder par exemple mardi comme seul jour travaillé
   - Définir une seule plage horaire de travail : **08:00 → 10:00**
   - (On peut aussi mettre 13:00–15:00, c'est symbolique)

**Résultat :** Pour GanttProject, un jour de travail = 2h. Mais pour nous, ça représente 1 créneau de SAE.

### 2. Convertir les estimations en "jours SAE"

Dans le tableau, on a tout en heures, par exemple :
- 1.3 – Écrire des user stories → 15h
- 3.1.2 – Implémenter l'accès BDD → 30h
- 7.1.1.8 – Préparer le rapport de planification → 42h

**Conversion :**
- 15h → 7,5 "jours" → **8 jours**
- 30h → **15 jours**
- 42h → **21 jours**

Dans GanttProject : colonne **Durée** → saisir ces valeurs (en jours).

## Lien avec le volume horaire officiel

### Le tableau S36…S14

Le tableau avec les 2h / 4h / 6h etc. n'a pas besoin d'être reproduit au détail dans le calendrier Gantt.

**Ce tableau sert surtout à :**
- Vérifier que le total des tâches ≈ **165h/étudiant**
- Vérifier que les gros blocs (analyse, dev, tests…) sont positionnés avant les jalons :
  - rendu analyse – 19/09/2025
  - soutenance intermédiaire – 25/09/2025
  - rapport de planif – 17/10/2025
  - etc.

### Ce que les enseignants regardent

- Est-ce que les jalons sont cohérents dans le temps ?
- Est-ce que le total d'effort colle à **165h/étudiant** ?
- Est-ce que les dépendances entre tâches sont logiques ?

**Ils ne vont pas recouper** "S39 = 4h FI + 2h FI+FA" avec chaque case du calendrier Gantt, c'est beaucoup trop fin.

## Option avancée (facultatif)

Si on veut être plus précis et se rapprocher du tableau officiel :

1. Garder la convention "1 jour Gantt = 2h"
2. Dans **Calendrier → Exceptions**, pour certaines semaines de vacances FI :
   - Ajouter des jours en plus comme travaillés
   - Avec plusieurs plages (par exemple 3 × 2h dans la même journée pour représenter 6h)

**Note :** C'est ultra chronophage pour un gain très faible. En général, les profs de gestion de projet attendent plutôt :
- une structure claire (WBS bien reflétée)
- un Gantt lisible avec jalons
- un calcul des charges cohérent (Excel + 165h)

## Résumé

1. **Ne pas chercher à forcer 7h/jour**, ce n'est pas adapté à la SAÉ
2. **Décider que :** 1 jour Gantt = 1 créneau de 2h de SAE
3. **Dans GanttProject**, régler le calendrier pour 2h de travail par jour (par ex. mardi 8–10)
4. **Convertir toutes les estimations :** durée = heures ÷ 2 (et arrondir à l'entier supérieur)
5. **Placer les jalons** en fonction des dates données dans les consignes

## Cohérence

Cette convention reste cohérente avec :
- les 165h par étudiant
- le tableau des heures
- ce que les enseignants attendent (ils savent très bien que "jour" dans un Gantt étudiant, c'est souvent une unité de travail, pas 7 vraies heures)
