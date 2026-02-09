# Les processus 
## Notion 
c'est une instance dynamque de programme 

contient code et donnée 

```mermaid
flowchart TD
    A["Le programme fait beaucoup de malloc<br/>(allocations dynamiques)"] --> B["Le tas (heap) grossit"]
    B --> C["La pile (stack) est utilisée<br/>par les appels de fonctions"]
    C --> D["La mémoire disponible diminue"]
    D --> E{"Y a-t-il encore<br/>assez de mémoire ?"}
    E -- "Oui" --> B
    E -- "Non" --> F["Échec d'allocation<br/>(malloc retourne NULL)"]
    F --> G["Si le programme ne gère pas l'erreur"]
    G --> H["Comportement indéfini<br/>(souvent crash / arrêt du processus)"]
    H --> I["Image simplifiée de cours :<br/>on dit que pile et tas \"se rencontrent\""]
```

## Géométrie d'un disque du dur 

#### Concrétement 

Un disque dur fonctionne de manière similaire à un vinyle : il est composé de plateaux circulaires qui tournent, et un bras mobile se déplace pour lire ou écrire les données. Sur chaque plateau, les informations sont organisées en pistes concentriques, et la tête de lecture/écriture du bras peut accéder à n’importe laquelle de ces pistes. Contrairement à l’idée que le fichier est lu en une seule fois sur toute la surface, les données d’un fichier peuvent être réparties sur plusieurs secteurs et pistes différentes du disque, que la tête va lire successivement.

![Schéma d'un disque dur, avec plateaux, pistes, secteurs et bras de lecture](https://upload.wikimedia.org/wikipedia/commons/0/0f/Dd1.png)


## Le SGF (Système de Gestion de Fichier)

- But masque l'aspect "sectuer" pour manipuler que des fichier
- Les fichier sont fragmenté sur le disque 
- le plus simple : FAT Dos
    - FAT : File Allocation Table 

### SGF Unix

→ Pas de FAT dans le SGF Unix.
    À la place, on utilise des structures comme les *inodes*, qui contiennent des pointeurs vers les blocs de données et/ou des blocs d'adresses (pour les gros fichiers, plusieurs niveaux d’indirection sont utilisés) : cela permet de stocker des gros fichiers répartis sur le disque.

![Schéma simplifié d’un inode Unix (pointeurs directs et indirects)](fileSystemeUNIX.png)


