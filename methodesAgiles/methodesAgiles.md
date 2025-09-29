# Cours de Méthodes Agiles

# Méthode Scrum

## Trois grands rôles principaux 

<span style="color:#f57c00"><strong>Product Owner</strong></span> : Définit les exigences et priorités et représente le client dans le projet (Tuteur)

- **Vision du produit** : Porte la vision globale et s’assure que chaque fonctionnalité a du sens.
- **Gestion du Product Backlog** : Tient à jour et priorise la liste des tâches (backlog voir exemple ⬇️) selon la valeur pour le client.
- **Interface parties prenantes** : Recueille les besoins et communique avec clients et équipe.
- **Validation** : Accepte ou refuse les livrables à chaque sprint.
- **Décisions rapides** : Répond vite aux questions et fixe les priorités.
- **Maximisation de la valeur** : Oriente l’équipe sur ce qui apporte le plus de valeur.

<span style="color:#2e7d32"><strong>Équipe de Développement</strong></span> : L’équipe de développement est composée de professionnels qui réalisent le travail technique nécessaire pour livrer les incréments du produit à chaque sprint. Elle est auto-organisée, pluridisciplinaire et responsable de la qualité des livrables. Ses principales responsabilités sont :

- **Polyvalence et multitâche** : Chaque membre peut intervenir sur plusieurs aspects du projet (développement, tests, documentation, etc.), favorisant la flexibilité et la réactivité de l’équipe.
- **Développer et tester** : Transformer le backlog en fonctionnalités prêtes à l’emploi.
- **S’auto-organiser** : Choisir ensemble comment atteindre les objectifs du sprint.
- **Collaborer** : Partager l’info, s’entraider, bien communiquer.
- **S’améliorer** : Identifier et appliquer des axes de progrès à chaque rétrospective.
- **Assurer la qualité** : Garantir un code fiable et bien documenté à chaque itération.

<span style="color:#1976d2"><strong>Scrum Master</strong></span> : Garant du cadre Scrum, il accompagne l’équipe et s’assure du respect des pratiques agiles (Membre de la SAE).

- **Facilitateur** : Organise et anime les cérémonies Scrum (Daily, Sprint Planning, Review, Rétrospective).
- **Suppression des obstacles** : Aide l’équipe à identifier et lever les blocages.
- **Coach agile** : Accompagne l’équipe dans l’adoption et l’amélioration continue des pratiques agiles.
- **Protection de l’équipe** : Protège l’équipe des interruptions extérieures et veille à un environnement de travail sain.
- **Médiateur** : Favorise la communication et la résolution des conflits au sein de l’équipe.
- **Transmission de la culture agile** : Sensibilise l’équipe et les parties prenantes à l’esprit et aux valeurs agiles.



## Cycle des Sprints

```mermaid
graph LR
    A[Sprint Planning] --> B[Sprint 1-4 semaines]
    B --> C[Daily Scrum<br/>quotidien]
    C --> D[Sprint Review]
    D --> E[Sprint Retrospective]
    E --> F[Sprint Planning<br/>suivant]
    F --> B
    
    style A fill:#ffecb3,stroke:#f9a825,stroke-width:2px
    style B fill:#bbdefb,stroke:#1e88e5,stroke-width:2px
    style C fill:#c8e6c9,stroke:#2e7d32,stroke-width:2px
    style D fill:#ffcdd2,stroke:#e53935,stroke-width:2px
    style E fill:#f3e5f5,stroke:#7b1fa2,stroke-width:2px
    style F fill:#fff3e0,stroke:#ffb74d,stroke-width:2px
```

### Description des Phases (événements) 

**<span style="color:#f9a825">Sprint Planning</span>** : Planification du sprint, sélection des tâches du Product Backlog et estimation du travail.
Tache que l'on rentre généralement dans un Kanban. (voir exemple de Kanban ⬇️)

**<span style="color:#1e88e5">Sprint (1-4 semaines)</span>** : Période de développement où l'équipe travaille sur les tâches sélectionnées (userStory pour coller au cours).

**<span style="color:#2e7d32">Daily Meeting</span>**  
Réunion quotidienne de 15 minutes pour synchroniser l'équipe et identifier les obstacles.  
Constituée d'une réponse de chaque membre de l'équipe : 
1. Qu'ai-je fait hier ?
2. Que vais-je faire aujourd'hui ?
3. Ai-je rencontré des obstacles ou des problèmes ?



**<span style="color:#e53935">Sprint Review</span>** : Démonstration du travail accompli aux parties prenantes et collecte des retours.

**<span style="color:#7b1fa2">Sprint Retrospective</span>** : Réflexion sur le processus pour identifier les améliorations à apporter.
Question courante : 
- Qu'est-ce qui a bien fonctionné pendant ce sprint ?
- Qu'est-ce qui aurait pu mieux se passer ?
- Quels obstacles avons-nous rencontrés et comment les avons-nous surmontés (ou pas) ?
- Que pouvons-nous améliorer pour le prochain sprint ?
- Avons-nous respecté nos engagements et nos processus ?
- Y a-t-il des points de friction ou des tensions dans l'équipe ?
- Quelles actions concrètes allons-nous mettre en place pour progresser ?


**<span style="color:#ffb74d">Sprint Planning suivant</span>** : Retour au début du cycle pour planifier le prochain sprint.

## Les Artefacts
Légende Kanban : <span style="color:#9e9e9e">À faire</span> • <span style="color:#1e88e5">En cours</span> • <span style="color:#2e7d32">Terminé</span>
> ### Exemple de tableau Kanban
> 
> | À faire                | En cours                | Terminé                |
> |------------------------|-------------------------|------------------------|
> | Rédiger la user story  | Développer la feature X | Corriger le bug Y      |
> | Préparer la réunion    | Écrire les tests unitaires | Mettre à jour la documentation |
> | Concevoir la maquette  |                         |                        |
> 
> Chaque colonne représente un état d’avancement des tâches. Les tâches passent de « À faire » à « En cours » puis à « Terminé » au fil du sprint.

> ### Exemple de Product Backlog
>
> | Priorité | Utilisateur    | Fonctionnalité                                 | Estimation (points) | Statut   |
> |----------|----------------|------------------------------------------------|---------------------|----------|
> | 1        | Utilisateur    | Inscription à la plateforme                    | 5                   | À faire  |
> | 2        | Utilisateur    | Connexion à son compte                         | 3                   | À faire  |
> | 3        | Utilisateur    | Réinitialisation du mot de passe               | 2                   | À faire  |
> | 4        | Utilisateur    | Modification des informations du profil        | 5                   | À faire  |
> | 5        | Administrateur | Visualisation de la liste des utilisateurs     | 3                   | À faire  |
>
>L'estimation en points correspond au niveau de difficulté estimé  par l'équipe pour une tache donné (définit par exemple avec me scrum poker)


## Déroulement d'un cycle scrum 
Voici le déroulement typique d’un cycle Scrum, en mettant l’accent sur le rôle du Product Owner (PO) qui rédige et priorise le Product Backlog :

1. **Rédaction et priorisation du Product Backlog**  
   Le Product Owner (PO) recueille les besoins des parties prenantes et rédige les user stories dans le Product Backlog. Il les priorise en fonction de la valeur métier, des risques et des dépendances.

2. **Sprint Planning**  
   L’équipe Scrum (PO, Scrum Master, Développeurs) se réunit pour sélectionner les éléments du Product Backlog à réaliser pendant le sprint. Le PO explique les user stories et répond aux questions de l’équipe.

3. **Déroulement du Sprint**  
   L’équipe de développement travaille sur les tâches sélectionnées. Le PO reste disponible pour clarifier les besoins et ajuster les priorités si nécessaire.

4. **Daily Meeting (Scrum quotidien)**  
   Chaque jour, l’équipe se synchronise lors d’une courte réunion. Le PO peut y assister pour écouter les avancées et les éventuels blocages, mais il n’intervient pas dans la planification technique.

5. **Sprint Review**  
   À la fin du sprint, l’équipe présente les fonctionnalités terminées au PO et aux parties prenantes. Le PO valide ou refuse les livrables selon les critères d’acceptation.

6. **Sprint Retrospective**  
   L’équipe (avec ou sans le PO) analyse le déroulement du sprint pour identifier des axes d’amélioration.

7. **Mise à jour du Product Backlog**  
   Le PO intègre les retours de la Sprint Review et de la Retrospective pour ajuster et enrichir le Product Backlog, préparant ainsi le prochain cycle.

Ce cycle se répète à chaque sprint, permettant une amélioration continue du produit et du processus.

## La User Story

La **User Story** (ou « histoire utilisateur ») est un outil clé des méthodes agiles pour exprimer un besoin du point de vue de l’utilisateur. Voici les points principaux à retenir :

- **Définition** :  
  Une User Story décrit une fonctionnalité ou un besoin sous forme simple, centrée sur l’utilisateur ou le client.

- **Structure type** :  
  > <span style="color:#00897b"><strong>En tant que</strong></span> [utilisateur]  
  > <span style="color:#3949ab"><strong>Je veux</strong></span> [action]  
  > <span style="color:#6d4c41"><strong>Afin de</strong></span> [objectif]

  *Exemple :*
  > En tant qu’**utilisateur**,  
  > Je veux **pouvoir réinitialiser mon mot de passe**,  
  > Afin de **récupérer l’accès à mon compte en cas d’oubli**.

- **Critères INVEST** :  
  Une bonne User Story doit être :
  - <span style="color:#2962ff"><strong>I</strong></span>ndépendante
  - <span style="color:#00acc1"><strong>N</strong></span>égociable
  - <span style="color:#2e7d32"><strong>V</strong></span>aleur métier claire
  - <span style="color:#f9a825"><strong>E</strong></span>stimable
  - <span style="color:#8e24aa"><strong>S</strong></span>imple (petite)
  - <span style="color:#e53935"><strong>T</strong></span>estable

- **Critères d’acceptation** :  
  Chaque User Story doit être accompagnée de critères d’acceptation précis, qui définissent quand la story est considérée comme terminée.

  *Exemple :*
  - ✅ <span style="color:#2e7d32">L’utilisateur reçoit un email de réinitialisation.</span>
  - ✅ <span style="color:#2e7d32">Le lien de réinitialisation expire après 24h.</span>
  - ⚠️ <span style="color:#c62828">Un message d’erreur s’affiche si l’email n’est pas reconnu.</span>

- **Avantages** :  
  - Favorise la communication et la compréhension des besoins.
  - Permet de prioriser et d’estimer facilement les tâches.
  - Facilite l’adaptation aux changements.

- **Bonnes pratiques** :  
  - Rédiger les User Stories en collaboration avec l’équipe et le Product Owner.
  - Ajouter des exemples et des critères d’acceptation clairs.
  - Découper les stories trop grandes en stories plus petites.

En résumé, la User Story est un outil simple et puissant pour exprimer les besoins fonctionnels, guider le développement et assurer la satisfaction des utilisateurs.

###  Epic Story 

Une **Epic Story** (ou simplement « Epic ») est une User Story de grande taille, souvent trop vaste pour être réalisée en un seul sprint. Elle regroupe plusieurs User Stories plus petites et permet de structurer des besoins complexes ou des fonctionnalités majeures. Les Epics sont découpées progressivement en stories plus détaillées au fil de l’avancement du projet.

### Rétropective de sprint 

Afin de mener à bien la rétrospective de sprint, il existe plusieurs méthodes, dont :

- la méthode <span style="color:#fbc02d"><strong>Keep Drop Start</strong></span> :  
  Cette méthode consiste à structurer la rétrospective autour de trois axes :
  - <span style="color:#2e7d32"><strong>Keep</strong></span> : Identifier ce que l’équipe souhaite conserver, c’est-à-dire les pratiques ou éléments qui ont bien fonctionné durant le sprint.
  - <span style="color:#e53935"><strong>Drop</strong></span> : Déterminer ce qu’il faut arrêter de faire, c’est-à-dire les actions, comportements ou processus qui n’ont pas apporté de valeur ou ont posé problème.
  - <span style="color:#1976d2"><strong>Start</strong></span> : Proposer de nouvelles actions ou expérimentations à mettre en place pour améliorer le prochain sprint.

  Cette approche simple et visuelle favorise la participation de tous et permet de cibler rapidement les axes d’amélioration. Pour les actions a mener il est nécessaire d'attibuer 3 points à chacun. Les post it avec le plus de point sont retenus.

- la méthode <span style="color:#7b1fa2"><strong>Variante</strong></span> :  
  Cette méthode propose d’aborder la rétrospective à travers plusieurs axes originaux et complémentaires :

  - <span style="color:#2e7d32"><strong>✅ Qu’est-ce qui a bien marché ?</strong></span>  
    Identifier les points positifs et les succès du sprint.

  - <span style="color:#1976d2"><strong>🔜 Que faut-il faire lors du prochain sprint ?</strong></span>  
    Définir les actions à entreprendre ou à améliorer pour la prochaine itération.

  - <span style="color:#fbc02d"><strong>💡 Qu’ai-je appris ?</strong></span>  
    Partager les apprentissages, découvertes ou nouvelles compétences acquises.

  - <span style="color:#e53935"><strong>❓ Qu’est-ce qui est mal compris ou doit être clarifié pour la suite ?</strong></span>  
    Mettre en avant les zones d’ombre, incompréhensions ou points à éclaircir.

  - <span style="color:#ff7043"><strong>😤 Qu’est-ce qui m’a rendu fou ?</strong></span>  
    Exprimer les frustrations, irritations ou obstacles rencontrés.

  - <span style="color:#00acc1"><strong>😂 Qu’est-ce qui m’a fait rire ?</strong></span>  
    Partager les moments de bonne humeur ou anecdotes amusantes du sprint.

  Cette variante permet d’aborder la rétrospective de façon plus humaine et ludique, tout en favorisant l’expression de chacun et la cohésion de l’équipe.

  On peut également poursuivre avec la méthode en étoile, qui consiste à organiser la rétrospective autour de catégories disposées en étoile, telles que :
   - Continuer à ...
   - Faire plus de ...
   - Commencer à ...
   - Faire moins de ...
   - Arrêter de ...

  Cette présentation visuelle facilite la réflexion collective et permet à chaque membre de l’équipe de s’exprimer sur différents axes d’amélioration.

### Les contradictions 
- <span style="color:#1976d2"><strong>Contrat simple en agile</strong></span>  
  <span style="color:#2e7d32"><strong>Pour :</strong></span>
  - <span style="color:#388e3c">Grande flexibilité pour adapter le périmètre en fonction des besoins réels du client.</span>
  - <span style="color:#388e3c">Favorise la collaboration et la confiance entre l’équipe et le client.</span>
  - <span style="color:#388e3c">Permet d’intégrer facilement les retours et changements en cours de projet.</span>
  - <span style="color:#388e3c">Encourage la transparence et l’amélioration continue.</span>
  
  <span style="color:#e53935"><strong>Contre :</strong></span>
  - <span style="color:#d32f2f">Difficulté à estimer précisément le budget et la durée du projet.</span>
  - <span style="color:#d32f2f">Risque de dérive du périmètre si les attentes ne sont pas bien cadrées.</span>
  - <span style="color:#d32f2f">Peut générer de l’incertitude pour le client sur le résultat final.</span>
  - <span style="color:#d32f2f">Nécessite une forte implication du client tout au long du projet.</span>

- <span style="color:#fbc02d"><strong>Contrat au forfait en agile</strong></span>  
  <span style="color:#2e7d32"><strong>Pour :</strong></span>
  - <span style="color:#388e3c">Budget, délais et périmètre définis dès le départ, ce qui rassure le client.</span>
  - <span style="color:#388e3c">Permet une planification plus précise des ressources et des livrables.</span>
  - <span style="color:#388e3c">Offre un cadre contractuel clair pour les deux parties.</span>
  - <span style="color:#388e3c">Peut convenir à des projets avec des exigences bien identifiées.</span>

  <span style="color:#e53935"><strong>Contre :</strong></span>
  - <span style="color:#d32f2f">Moins de flexibilité pour intégrer des changements en cours de route.</span>
  - <span style="color:#d32f2f">Toute modification importante nécessite un avenant ou une renégociation.</span>
  - <span style="color:#d32f2f">L’agilité se limite souvent à la gestion interne de l’équipe.</span>
  - <span style="color:#d32f2f">Risque de tensions si le périmètre initial est mal défini ou sous-estimé.</span>
- <span style="color:#00acc1"><strong>Contractualisation par sprint en agile</strong></span>  
  <span style="color:#2e7d32"><strong>Pour :</strong></span>
  - <span style="color:#388e3c">Permet une adaptation très fine à l’évolution des besoins à chaque itération.</span>
  - <span style="color:#388e3c">Engagement progressif : le client ne s’engage que pour un sprint à la fois.</span>
  - <span style="color:#388e3c">Réduit les risques financiers et fonctionnels en limitant l’investissement à court terme.</span>
  - <span style="color:#388e3c">Favorise la transparence sur l’avancement et la valeur livrée à chaque sprint.</span>

  <span style="color:#e53935"><strong>Contre :</strong></span>
  - <span style="color:#d32f2f">Peut générer un sentiment d’incertitude sur la vision globale et la planification long terme.</span>
  - <span style="color:#d32f2f">Nécessite une forte implication continue du client pour valider et prioriser à chaque sprint.</span>
  - <span style="color:#d32f2f">Difficile d’obtenir des engagements fermes sur le budget total ou la date de livraison finale.</span>
  - <span style="color:#d32f2f">Peut être perçu comme un manque d’engagement réciproque sur la durée du projet.</span>
  ### Que faire des user stories non livrées lors d’une facturation par sprint ?

  Lorsqu’on contractualise et facture au sprint, il arrive que certaines user stories prévues ne soient pas terminées à la fin de l’itération. La gestion de ces user stories non livrées doit être clarifiée dès le départ pour éviter tout malentendu entre le client et l’équipe.

  **Plusieurs options existent :**

  - <span style="color:#fbc02d"><strong>Refacturation au sprint suivant</strong></span>  
    Les user stories non terminées sont reportées dans le backlog et intégrées au sprint suivant. Elles ne sont facturées que lorsqu’elles sont effectivement livrées et validées par le client.  
    <span style="color:#388e3c">Avantage :</span> Le client ne paie que pour la valeur réellement livrée.  
    <span style="color:#d32f2f">Inconvénient :</span> Cela peut compliquer la gestion de la facturation et du suivi.

  - <span style="color:#fbc02d"><strong>Facturation du sprint tel que réalisé</strong></span>  
    Le sprint est facturé dans son ensemble, même si toutes les user stories n’ont pas été livrées, car l’équipe a consacré le temps prévu.  
    <span style="color:#388e3c">Avantage :</span> Simplicité de gestion et respect du cadre temporel.  
    <span style="color:#d32f2f">Inconvénient :</span> Le client peut avoir le sentiment de payer pour des fonctionnalités non livrées.

  - <span style="color:#fbc02d"><strong>Partage du risque</strong></span>  
    Un compromis peut être trouvé : par exemple, seules les user stories terminées sont facturées, ou bien un pourcentage du sprint est retenu jusqu’à la livraison complète.  
    <span style="color:#388e3c">Avantage :</span> Équilibre entre engagement de l’équipe et satisfaction du client.  
    <span style="color:#d32f2f">Inconvénient :</span> Cela nécessite une négociation et une contractualisation précise.

  **Qui prend en charge le coût des user stories non livrées ?**

  - <span style="color:#1976d2"><strong>L’équipe (le prestataire)</strong></span> prend en charge si le retard est dû à un problème d’organisation interne, de sous-estimation ou de blocage technique non anticipé.
  - <span style="color:#388e3c"><strong>Le client</strong></span> prend en charge si le retard est causé par un manque de disponibilité, des validations tardives ou des changements de priorités de sa part.
  - <span style="color:#fbc02d"><strong>Cas mixte</strong></span> : souvent, la réalité est partagée et il est important de définir dans le contrat les cas de figure et la répartition des responsabilités.

  > **À retenir :**  
  <span style="color:#fbc02d"><strong>La gestion des user stories non livrées doit être anticipée dans le contrat de facturation par sprint, pour garantir la transparence et la confiance entre les parties.</strong></span>

  ### Comment gérer les bugs et la non-validation des user stories

  La gestion des bugs et des user stories non validées est un point clé dans un projet agile, notamment en Scrum. Voici comment cela peut être abordé :

  **Bugs et defect stories :**
  - Les bugs identifiés pendant un sprint sont généralement ajoutés au backlog sous forme de « defect stories » et priorisés selon leur impact.
  - <span style="color:#e53935"><strong>Si un bug (décrit alors comme une defect story) bloque la livraison d’une user story, il doit être corrigé avant la validation de celle-ci.</strong></span>
  - Les defect stories critiques peuvent être traitées immédiatement, tandis que les moins urgentes sont planifiées pour un sprint ultérieur.

  **User stories non validées :**
  - <span style="color:#e53935"><strong>Une user story non validée à la fin du sprint (car incomplète ou ne répondant pas aux critères d’acceptation) n’est pas considérée comme « terminée ».</strong></span>
  - Elle retourne dans le backlog produit, est réévaluée et priorisée pour un prochain sprint.
  - La non-validation peut entraîner une discussion lors de la rétrospective pour comprendre les causes (sous-estimation, blocage, manque de clarté, etc.) et améliorer le processus.

  **À retenir :**
  - <span style="color:#1976d2"><strong>La transparence et la communication avec le client sont essentielles pour gérer ces situations.</strong></span>
  - Il est important de documenter les décisions prises et d’ajuster le contrat ou les attentes si nécessaire.


## Les différents type de contrat en methode scrum 

### Contrat à coût variable (ou « Time & Material »)

Dans ce type de contrat, le client s’engage à rémunérer l’équipe sur la base du <span style="color:#1976d2"><strong>temps effectivement passé</strong></span> et des <span style="color:#1976d2"><strong>ressources réellement mobilisées</strong></span>, plutôt que sur un périmètre fonctionnel figé à l’avance. L’équipe travaille pendant une période convenue (par exemple, un certain nombre de sprints ou de semaines), et le client paie pour le travail effectivement réalisé, généralement sur la base d’un tarif journalier ou horaire.

**<span style="color:#fbc02d">Caractéristiques principales :</span>**
- <span style="color:#388e3c"><strong>Flexibilité maximale</strong></span> : Le client peut ajuster les priorités, ajouter ou retirer des fonctionnalités au fil du projet, en fonction de l’avancement et des besoins réels.
- <span style="color:#1976d2"><strong>Transparence</strong></span> : Le suivi du temps passé et des livrables est régulier, souvent via des points d’avancement ou des démonstrations à la fin de chaque sprint.
- <span style="color:#f57c00"><strong>Engagement sur les moyens, pas sur le résultat</strong></span> : L’équipe s’engage à fournir ses efforts et son expertise, mais le périmètre exact du produit final peut évoluer.

**<span style="color:#388e3c">Avantages :</span>**
- <span style="color:#388e3c">Adapté aux projets où les besoins sont susceptibles d’évoluer ou ne sont pas totalement définis au départ.</span>
- <span style="color:#388e3c">Permet une grande réactivité face aux changements de contexte ou de priorités.</span>
- <span style="color:#388e3c">Favorise la collaboration et la confiance entre le client et l’équipe.</span>

**<span style="color:#d32f2f">Inconvénients :</span>**
- <span style="color:#d32f2f">Le budget final peut être difficile à anticiper pour le client, car il dépend du temps réellement consommé.</span> <span style="color:#d32f2f"><strong>→ tout le risque pour le client</strong></span>
- <span style="color:#d32f2f">Nécessite une grande transparence et un suivi rigoureux pour éviter les dérives.</span>

**<span style="color:#fbc02d">À retenir :</span>**  
<span style="color:#1976d2"><strong>Le contrat à coût variable</strong></span> est particulièrement adapté aux environnements agiles, où l’incertitude et l’évolution des besoins font partie intégrante du projet.  
Il repose sur la <span style="color:#388e3c"><strong>confiance</strong></span>, la <span style="color:#388e3c"><strong>communication</strong></span> et la capacité à <span style="color:#f57c00"><strong>piloter le projet en continu</strong></span>.


### Contrat à coût fixe

Dans un **contrat à coût fixe**, le client et le prestataire s’accordent dès le départ sur un **périmètre fonctionnel précis** (ensemble des fonctionnalités à livrer) et sur un **prix global** pour la réalisation de ce périmètre. Cela signifie que le montant à payer est déterminé à l’avance, indépendamment du temps ou des ressources réellement consommés pendant le projet.

**<span style="color:#fbc02d">Caractéristiques principales :</span>**
- <span style="color:#1976d2"><strong>Périmètre figé</strong></span> : Toutes les fonctionnalités à livrer sont définies en détail avant le début du projet. Toute modification du périmètre (ajout, suppression ou modification de fonctionnalités) nécessite un avenant au contrat.
- <span style="color:#388e3c"><strong>Coût connu à l’avance</strong></span> : Le client connaît le budget total dès la signature du contrat, ce qui facilite la planification financière.
- <span style="color:#d32f2f"><strong>Moins de flexibilité</strong></span> : Les changements en cours de projet sont difficiles à intégrer sans réévaluation du coût et du planning.

**<span style="color:#388e3c">Avantages :</span>**
- <span style="color:#388e3c">Sécurité budgétaire pour le client : le coût ne peut pas dépasser le montant convenu, sauf si le périmètre change.</span>
- <span style="color:#388e3c">Clarté sur les livrables attendus et les délais.</span>

**<span style="color:#d32f2f">Inconvénients :</span>**
- <span style="color:#d32f2f">Manque de souplesse : toute évolution du besoin implique des négociations et des délais supplémentaires.</span>
- <span style="color:#d32f2f">Risque de mésentente sur le périmètre : si les spécifications ne sont pas parfaitement claires, des conflits peuvent apparaître.</span>
- <span style="color:#d32f2f">Peut générer une relation « client vs fournisseur » plutôt qu’un esprit de collaboration.</span>

**<span style="color:#fbc02d">À retenir :</span>**  
Le **contrat à coût fixe** est adapté aux projets où le **périmètre est stable et bien défini dès le départ**. Il offre une sécurité sur le coût, mais **limite la capacité à s’adapter aux changements** en cours de route.  
Dans un contexte agile, ce type de contrat peut être difficile à appliquer, car l’agilité repose justement sur l’acceptation du changement et l’adaptation continue du produit aux besoins réels du client.  
Pour rendre ce modèle compatible avec l’agilité, il est parfois possible de découper le projet en lots ou en phases, chacune faisant l’objet d’un mini-contrat à coût fixe, ou de prévoir des clauses d’ajustement du périmètre.



### Coût fixe et périmètre fixe

Dans un modèle <span style="color:#1976d2"><strong>coût fixe et périmètre fixe</strong></span>, le client et le prestataire s’engagent contractuellement sur deux éléments immuables : <span style="color:#388e3c"><strong>le prix global du projet</strong></span> et <span style="color:#388e3c"><strong>la liste exhaustive des fonctionnalités à livrer</strong></span>. Ce type de contrat est traditionnellement utilisé dans les approches classiques de gestion de projet, mais il peut aussi être adapté à certains contextes agiles, à condition d’accepter certaines contraintes.

**<span style="color:#fbc02d">Principes :</span>**
- <span style="color:#1976d2"><strong>Tout est défini à l’avance</strong></span> : le cahier des charges doit être complet, précis et validé par toutes les parties avant le lancement du projet.
- <span style="color:#d32f2f"><strong>Aucune évolution sans avenant</strong></span> : toute modification du périmètre (ajout, retrait ou modification de fonctionnalités) nécessite une renégociation du contrat (avenant) et, souvent, une réévaluation du coût et des délais.
- <span style="color:#388e3c"><strong>Engagement fort sur le résultat</strong></span> : le prestataire s’engage à livrer exactement ce qui a été défini, dans le budget et le délai convenus.

**<span style="color:#fbc02d">Conséquences :</span>**
- <span style="color:#388e3c"><strong>Sécurité budgétaire maximale pour le client</strong></span>, mais <span style="color:#d32f2f"><strong>peu de souplesse</strong></span> en cas de changement de besoin.
- <span style="color:#d32f2f"><strong>Risque pour le fournisseur</strong></span> en cas de sous-estimation de la charge ou de mauvaise compréhension du besoin initial.
- <span style="color:#d32f2f"><strong>Relation contractuelle parfois tendue</strong></span> si des imprévus apparaissent ou si le client souhaite faire évoluer le produit en cours de route.

**<span style="color:#fbc02d">À retenir :</span>**  
Le modèle <span style="color:#1976d2"><strong>coût fixe et périmètre fixe</strong></span> est rassurant pour le client sur le plan financier, mais il est <span style="color:#d32f2f"><strong>peu compatible avec l’esprit agile</strong></span>, qui valorise l’adaptation et l’amélioration continue. Il convient surtout aux projets où <span style="color:#388e3c"><strong>tout est connu et maîtrisé dès le départ</strong></span>, et où le besoin d’évolution est faible ou inexistant.

### Budget par sprint

Dans un modèle de **budget par sprint** (ou « paiement à l’itération »), le client s’engage à payer le prestataire à la fin de chaque sprint, c’est-à-dire à intervalles réguliers correspondant à la durée d’une itération (souvent 2 à 4 semaines). Le périmètre de chaque sprint est défini en début d’itération, en concertation avec le client, ce qui permet d’ajuster les priorités et de s’adapter aux besoins réels au fil du projet.

**<span style="color:#fbc02d">Caractéristiques principales :</span>**
- <span style="color:#1976d2"><strong>Périmètre évolutif</strong></span> : Les fonctionnalités à réaliser sont décidées sprint après sprint, en fonction de la valeur métier et du retour du client.
- <span style="color:#388e3c"><strong>Budget maîtrisé par itération</strong></span> : Le client connaît le coût de chaque sprint à l’avance et peut décider de poursuivre, d’arrêter ou d’ajuster le projet à la fin de chaque itération.
- <span style="color:#388e3c"><strong>Grande flexibilité</strong></span> : Le client peut modifier ses priorités ou le contenu des sprints en fonction de l’avancement et des retours utilisateurs.

**<span style="color:#388e3c">Avantages :</span>**
- <span style="color:#388e3c">Adaptation continue aux besoins réels du client.</span>
- <span style="color:#388e3c">Visibilité régulière sur l’avancement et le budget consommé.</span>
- <span style="color:#388e3c">Possibilité d’arrêter le projet à tout moment, sans surcoût.</span>

**<span style="color:#d32f2f">Inconvénients :</span>**
- <span style="color:#d32f2f">Moins de visibilité sur le coût total final si le nombre de sprints n’est pas fixé à l’avance.</span>
- <span style="color:#d32f2f">Nécessite une forte implication du client tout au long du projet.</span>

**<span style="color:#fbc02d">À retenir :</span>**  
Le **budget par sprint** est particulièrement adapté aux projets agiles, où l’on souhaite maximiser la valeur livrée à chaque itération et s’adapter en continu. Ce mode de fonctionnement favorise la collaboration, la transparence et la réactivité, tout en permettant au client de garder la maîtrise de son investissement au fil du temps.

### Payé pour rien, changement gratuit (« Money For Nothing, Change For Free »)

Le modèle « Payé pour rien, changement gratuit » (souvent appelé « Money For Nothing, Change For Free ») est un type de contrat hybride, conçu pour concilier la flexibilité de l’agilité avec la sécurité financière pour le prestataire. Il vise à rassurer le client sur sa capacité à changer d’avis sans surcoût, tout en protégeant le fournisseur contre les interruptions brutales de projet.

**<span style="color:#fbc02d">Principes :</span>**
- <span style="color:#1976d2"><strong>Changement gratuit</strong></span> : Le client peut modifier le périmètre du projet à tout moment, sans coût additionnel, tant que le budget global n’est pas dépassé.
- <span style="color:#388e3c"><strong>Arrêt anticipé possible</strong></span> : Si le client décide d’arrêter le projet avant la fin, il verse au prestataire une indemnité correspondant à une partie du budget restant (« payé pour rien »).
- <span style="color:#388e3c"><strong>Engagement sur la valeur</strong></span> : Le prestataire s’engage à livrer de la valeur à chaque itération, et le client garde la liberté d’ajuster ses priorités ou d’arrêter le projet si la valeur attendue n’est plus au rendez-vous.

**<span style="color:#388e3c">Avantages :</span>**
- <span style="color:#388e3c">Grande flexibilité pour le client, qui peut changer d’avis sans pénalité.</span>
- <span style="color:#388e3c">Sécurité pour le prestataire, qui est indemnisé en cas d’arrêt anticipé.</span>
- <span style="color:#388e3c">Favorise la transparence et la confiance entre les parties.</span>

**<span style="color:#d32f2f">Inconvénients :</span>**
- <span style="color:#d32f2f">Nécessite une grande maturité contractuelle et relationnelle.</span>
- <span style="color:#d32f2f">Peut être difficile à faire accepter dans certains contextes ou avec des clients peu familiers de l’agilité.</span>

**<span style="color:#fbc02d">À retenir :</span>**  
Le contrat « Payé pour rien, changement gratuit » est particulièrement adapté aux projets agiles où l’incertitude est forte et où la capacité à s’adapter rapidement est essentielle. Il permet au client de maximiser la valeur livrée tout en gardant la liberté de changer de cap, et il garantit au prestataire une juste rémunération même en cas d’arrêt prématuré du projet.


### Comparatif rapide

| Contrat                                      | Périmètre         | Coût              | Flexibilité      | Risque principal                                 |
|-----------------------------------------------|-------------------|-------------------|------------------|--------------------------------------------------|
| Coût variable (T&M)                          | Évolutif          | Variable          | Maximale         | Pour le client (dépassement de budget)           |
| Coût fixe                                    | Figé              | Fixe              | Faible           | Pour le fournisseur (dépassement de charge)      |
| Budget par sprint                            | Évolutif (par sprint) | Fixe (par sprint) | Élevée           | Pour le client (coût total incertain)            |
| Payé pour rien, changement gratuit (MFN, CFF)| Évolutif          | Fixe (global)     | Maximale         | Pour le client (indemnité d'arrêt anticipé), nécessite confiance |

## Méthode LeSS (Large Scale Scrum)

- <span style="color:#388e3c"><strong>Un seul backlog</strong></span> pour toutes les équipes
- <span style="color:#388e3c"><strong>Un unique Product Owner</strong></span>
- <span style="color:#388e3c"><strong>Même Definition of Done (DoD)</strong></span> pour tous
- <span style="color:#388e3c"><strong>Équipes multi-compétences uniquement</strong></span> (pas d’équipes spécialisées)
- <span style="color:#1976d2"><strong>Coordination et répartition</strong></span> entre équipes pour maximiser la valeur

**Déroulement en deux temps :**
1. <span style="color:#fbc02d"><strong>Planification commune</strong></span> : le Product Owner et des représentants des équipes répartissent ensemble les stories, avec possibilité de collaboration inter-équipes.
2. <span style="color:#fbc02d"><strong>Travail autonome</strong></span> : chaque équipe avance indépendamment (daily meeting propre), mais l’entraide reste possible entre membres d’équipes différentes.

- <span style="color:#1976d2"><strong>Scrum of Scrums</strong></span> : réunions ponctuelles pour synchroniser l’ensemble des équipes.

```mermaid
graph TD
    A[Product Owner] --> B(Planification Commune)
    B --> C{Équipe 1 Travail Autonome}
    B --> D{Équipe 2 Travail Autonome}

    C --> F(Daily Scrum Équipe 1)
    D --> G(Daily Scrum Équipe 2)
    F -- "Synchronisation" --> H(Scrum of Scrums)
    G -- "Synchronisation" --> H
    H --> B
```

