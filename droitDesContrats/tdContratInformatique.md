# TD 4 – Le contrat informatique
**Fleury Auguste**

> ***Note :** Les mots marqués d’un :"\*" sont expliqués dans le glossaire à la fin du document. (permet d'améliorer la facilité de compréhension du document)


## Étape 1 : Pourparlers et préparation

### 1. Receuil d'information auprés TechSolutions avant la rédaction du contrat

Avant de rédiger le contrat, il est nécessaire de faire un receuil de besoin en y intégrant aussi les contrainte afin de réaliser l'ERP*. 

Comme par exemple, une liste de : 
- Le **fonctionnement** de l’entreprise .  
- Les **besoins précis** du logiciel .
- Les différentes **contriantes** : type d’hébergement, compatibilité avec les outils existants, sécurité.  
- Les **objectifs d’évolution** comme les MAJ*.   
- Le **budget aloué** à la mission 
- Les **délais** attendus.  
- Les **personnes responsables** du projet et définition du PO*

Ainsi on peut à l'aide de ces informations nous permettent de rédiger clairement un cahier des charges* clair.

---

### 2. Documents ou contrats annexes utiles

Avant ou en parallèle du contrat principal, il peut être utile de prévoir :

- Un **cahier des charges fonctionnel** (document central décrivant les besoins et les fonctionnalités attendues).  
- Un **devis détaillé** ou une **proposition commerciale** du prestataire.  
- Un **accord de confidentialité (NDA)** pour protéger les informations échangées.  
- Un **planning prévisionnel** ou un **contrat de prestation intermédiaire** (pour la phase d’étude ou de prototype).  
- Éventuellement un **contrat de maintenance** à négocier plus tard, une fois le logiciel livré.

---

## Étape 2 : Rédaction du contrat principal

### 3. Articles de base à inclure

Un contrat de développement de logiciel sur mesure doit au minimum contenir les articles suivants :

1. **Objet du contrat** = ici développement du logiciel ERP pour TechSolutions.  
2. **Définitions** des livrables.  
3. **Durée et calendrier du projet** = déroulement prévu du projet.  
4. **Obligations du prestataire**, ici DevSoft.  
5. **Obligations du client**, ici TechSolutions.  
6. **Conditions financières** comme le prix et l'échéancier de paiement).  
7. **Livraison du logiciel.**  
8. **Garantie et maintenance**.   
9. **Confidentialité et sécurité.**  
10. **Propriété intellectuelle** soit :  droits d’auteur et cession éventuelle du code source. 
11. **Responsabilité et assurances**  
12. **Résiliation du contrat.**  
13. **Règlement des litiges et loi applicable.**

---

### 4. Clauses spécifiques à discuter

- **Clause de propriété intellectuelle** : afin de définir qui possède le code source (comme à l'aide de covention type Syntec (voir td5)) et qui possède les droits d’exploitation.  
- **Clause d’évolution** : permettre à TechSolutions de demander des ajouts ou améliorations plus tard.  
- **Clause de recette** : permet de faire la DoD pour la mise en production du projet.
- **Clause de pénalités** : en cas de retard de livraison ou de non-conformité.  
- **Clause de confidentialité** : pour protéger les données et les informations de l’entreprise.  
- **Clause de maintenance** : prévoir un suivi aprés avoir fini le projet.

---

### 5. Cession du code source : avantages et risques

**Si DevSoft cède le code source à TechSolutions :**

**Avantages pour TechSolutions :**
- Autonomie complète : elle pourra modifier ou faire évoluer le logiciel sans dépendre de DevSoft.
- Garantie de pérennité (normalement) : même si DevSoft disparaît, le logiciel reste exploitable et étendable a de nouvel utilisation. 

**Risques pour TechSolutions :**
- Responsabilité technique accrue : besoin de compétences internes ou d’un autre prestataire.  

**Avantages pour DevSoft :**
- La transparence et la confiance peuvent faciliter la relation commerciale.  
- Possibilité de faire payer la cession des droits en plus.

**Risques pour DevSoft :**
- Perte du contrôle sur le logiciel (plus de droits d’auteur), peut etre detourner d esa fonction actuel et ne plus repecter la vision de DevSoft.  
- Risque que le client réutilise ou revende le code sans autorisation (solution exploitable le vendre comme ça aps d'état d'âme)

---

## Étape 3 : Réception et PV 

### 6. Vérification du logiciel

Pour vérifié si le logiciel correpond au cahier des charges, il faut faire :

1. **Tests internes** par DevSoft.  
2. **Recette provisoire** : tests par TechSolutions sur la version avant la mise en production.  
3. **Recette définitive** : validation finale, confirmée par un **procès-verbal de réception** signé par les deux parties.


Ce procés-verbale prouve que le logiciel est conforme aux attentes et valide la fin du projet (ici utilisation de la DoD*).

---

### 7. Que faire en cas d’anomalies ou de fonctionnalités manquantes
Il faut : 
- Pendant la période de garantie, DevSoft doit corriger gratuitement les anomalies.  
- Un **Procés-Verbale de non-conformité** peut être établi si le logiciel ne respecte pas le cahier des charges.  
- Si les anomalies sont graves, TechSolutions peut refuser la réception et demander des corrections avant paiement.  
- Si le contrat le prévoit, une **clause corrective** s’applique pour suivre et corriger les bugs/probleme sur la durée.

---

## Conclusion

Le contrat de développement d’un logiciel sur mesure doit définir clairement les **rôles, responsabilités et droits** de chaque partie.  
Pour éviter les litiges, il est essentiel d’avoir un **cahier des charges précis**, une **recette rigoureuse** et une **clause de propriété intellectuelle**.  
Ainsi, le projet ce déroulera pour le mieux sans problèmes juridique et surout avec un produit conforme au attente de chacun. 


## Glossaire : 

#### **ERP (Enterprise Resource Planning)**
Logiciel de gestion intégré qui regroupe plusieurs fonctions d’une entreprise  
(comptabilité, ressources humaines, stock, production, etc.) dans un seul système.  
Il permet de centraliser les informations et de mieux organiser le travail entre les services.

#### **MAJ = (Mise à jour)**

#### **Product Owner**
Rôle clé dans un projet informatique, souvent présent dans la méthode Agile.  
Le Product Owner représente le client et définit les besoins du produit, fixe les priorités et valide les livrables. Il fait le lien entre l’équipe technique (développeurs) et les utilisateurs finaux. (définition issue du cours de management de projet de Mme Pouclet)

#### **Cahier des charges**
Document contractuel qui précise les besoins du client et les caractéristiques attendues du projet (fonctionnalités, contraintes techniques, délais, budget, etc.). 
Il sert de référence tout au long du développement et permet de vérifier, lors de la recette, si le prestataire a bien respecté les engagements convenus.
En cas de litige, il constitue une preuve essentielle pour déterminer les responsabilités des parties.

#### **PV = Procès-verbal**
Document écrit et signé par les deux parties à la fin d’une étape importante du projet (souvent la **recette**).
Dans un contrat informatique, le PV sert à confirmer que le logiciel a été vérifié et qu’il répond aux exigences du **cahier des charges**. 
Il a une valeur juridique : il marque l’acceptation officielle du livrable et peut déclencher le paiement du solde prévu dans l’échéancier de paiement.

### **DoD = Definition of Done**
Terme issu de la méthode Agile qui signifie « définition du terminé ».
C’est une liste de critères objectifs permettant de déterminer si une tâche, une fonctionnalité ou une version du logiciel est réellement terminée.
Par exemple : code relu, testé, intégré, documenté et validé par le **Product Owner**.
Le DoD garantit une qualité homogène et évite les livrables incomplets.