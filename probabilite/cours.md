# Cours 5 - Variable aléatoire continues 

Une **variable aléatoire $X$ est dite continue** s’il existe une **fonction $f : \mathbb{R} \to \mathbb{R}$, appelée densité de probabilité**, telle que pour tout intervalle réel $[a, b]$ :
$$
P(a \leq X \leq b) = \int_{a}^{b} f(x)\,dx
$$

La fonction ƒ s’appelle la **densité de probabilité de $X$**.

---

## Fiche Méthode : Variables Aléatoires Continues

### 1. Qu'est-ce qu'une variable aléatoire continue ?

*   C'est une variable dont les **valeurs peuvent être n'importe quel nombre dans un intervalle** (par exemple, la taille d'une personne, le temps d'attente à un arrêt de bus).
*   Contrairement aux variables discrètes (qui ont des valeurs distinctes comme le résultat d'un dé), ici, il y a une infinité de valeurs possibles entre deux points.

### 2. Le rôle de la fonction de densité de probabilité (**f(x)**)

*   Pour les variables continues, on ne parle **pas de la probabilité d'une valeur exacte** (elle est toujours de 0).
*   On parle plutôt de la **probabilité que la variable se trouve dans un certain intervalle**.
*   C'est là qu'intervient la **fonction de densité de probabilité, notée $f(x)$**. Elle nous aide à calculer ces probabilités.

### 3. Comment calculer la probabilité d'un intervalle ?

*   Pour trouver la probabilité que notre variable aléatoire $X$ se trouve entre deux valeurs $a$ et $b$ (c'est-à-dire $P(a \leq X \leq b)$), on utilise une **intégrale**.
*   L'intégrale de la fonction de densité $f(x)$ entre $a$ et $b$ nous donne cette probabilité.
    $$P(a \leq X \leq b) = \int_{a}^{b} f(x)\,dx$$
*   **En mots simples :** C'est l'aire sous la courbe de la fonction $f(x)$ entre les points $a$ et $b$.

### 4. Propriétés importantes de **f(x)** :

*   La fonction $f(x)$ doit toujours être **positive ou nulle** ($f(x) \geq 0$). Une probabilité ne peut pas être négative !
*   L'aire totale sous la courbe de $f(x)$ sur tout l'axe des nombres réels doit être **égale à 1**. C'est logique, car la somme de toutes les probabilités possibles doit faire 100%. ($$$\int_{-\infty}^{\infty} f(x)\,dx = 1$$$).

### 5. Cas particulier : La loi uniforme continue

Lorsqu'une variable aléatoire continue $X$ suit une **loi uniforme sur l'intervalle $[a, b]$**, cela signifie que toutes les valeurs de cet intervalle ont la même "densité" de probabilité d'apparition. Sa **fonction de densité de probabilité $f(x)$** est définie comme suit :

$$f(x) = \begin{cases}
\frac{1}{b-a} & \text{pour } a \leq x \leq b \\
0 & \text{ailleurs}
\end{cases}$$

---

## Démonstration de l'espérance mathématique pour une loi uniforme

Pour une variable aléatoire continue $X$ suivant une loi uniforme sur l'intervalle $[a, b]$, l'**espérance mathématique $\mathbf{E[X]}$** (la moyenne) est donnée par :

$$E[X] = \frac{a+b}{2}$$

Voici la démonstration étape par étape :

**1. Formule générale de l'espérance pour une variable continue**

L'**espérance $\mathbf{E[X]}$ d'une variable aléatoire continue** est définie par l'intégrale de $x$ multiplié par sa fonction de densité de probabilité $f(x)$ sur tout l'ensemble des réels :

$$E[X] = \int_{-\infty}^{\infty} x \cdot f(x)\,dx$$

**2. Application à la loi uniforme**

Pour une loi uniforme sur $[a, b]$, la fonction $f(x)$ est non nulle (et égale à $\frac{1}{b-a}$) uniquement entre $a$ et $b$. L'intégrale se simplifie donc à l'intervalle $[a, b]$ :

$$E[X] = \int_{a}^{b} x \cdot \frac{1}{b-a}\,dx$$

**3. Sortir la constante de l'intégrale**

$\frac{1}{b-a}$ est une constante, nous pouvons donc la sortir de l'intégrale :

$$E[X] = \frac{1}{b-a} \int_{a}^{b} x\,dx$$

**4. Calculer l'intégrale de x**

L'intégrale de $x$ est $\frac{x^2}{2}$ :

$$E[X] = \frac{1}{b-a} \left[\frac{x^2}{2}\right]_{a}^{b}$$

**5. Évaluer l'intégrale aux bornes**

Nous évaluons $\frac{x^2}{2}$ aux bornes $b$ et $a$ (c'est-à-dire $\frac{b^2}{2} - \frac{a^2}{2}$) :

$$E[X] = \frac{1}{b-a} \left(\frac{b^2}{2} - \frac{a^2}{2}\right)$$

**6. Factoriser et simplifier**

Nous pouvons factoriser $\frac{1}{2}$ et utiliser l'identité remarquable $b^2 - a^2 = (b-a)(b+a)$ :

$$E[X] = \frac{1}{b-a} \cdot \frac{1}{2} (b^2 - a^2)$$
$$E[X] = \frac{1}{2(b-a)} (b-a)(b+a)$$

Les termes $(b-a)$ s'annulent :

$$E[X] = \frac{1}{2} (b+a)$$

**7. Résultat final**

Ce qui nous donne l'espérance mathématique pour une loi uniforme :

$$E[X] = \frac{a+b}{2}$$

Cette démonstration montre comment, pour une distribution uniforme, l'espérance est simplement le point médian de l'intervalle. 


## Démonstration de la variance pour une loi uniforme

Pour une variable aléatoire continue $X$ suivant une loi uniforme sur l'intervalle $[a, b]$, la **variance $\mathbf{V[X]}$** est donnée par :

$$V[X] = \frac{(b-a)^2}{12}$$

Voici la démonstration étape par étape :

**1. Formule générale de la variance**

La **variance $\mathbf{V[X]}$ d'une variable aléatoire continue** est définie par la formule :

$$V[X] = \mathbf{E[X^2]} - (\mathbf{E[X]})^2$$

Nous avons déjà calculé $E[X] = \frac{a+b}{2}$. Nous devons maintenant calculer $E[X^2]$.

**2. Calcul de $\mathbf{E[X^2]}$ pour une loi uniforme**

La formule générale pour $E[X^2]$ est :

$$E[X^2] = \int_{-\infty}^{\infty} x^2 \cdot f(x)\,dx$$

Pour une loi uniforme sur $[a, b]$, $f(x) = \frac{1}{b-a}$ pour $a \leq x \leq b$, et $0$ ailleurs. L'intégrale devient donc :

$$E[X^2] = \int_{a}^{b} x^2 \cdot \frac{1}{b-a}\,dx$$

Nous sortons la constante de l'intégrale :

$$E[X^2] = \frac{1}{b-a} \int_{a}^{b} x^2\,dx$$

L'intégrale de $x^2$ est $\frac{x^3}{3}$ :

$$E[X^2] = \frac{1}{b-a} \left[\frac{x^3}{3}\right]_{a}^{b}$$

Nous évaluons l'intégrale aux bornes :

$$E[X^2] = \frac{1}{b-a} \left(\frac{b^3}{3} - \frac{a^3}{3}\right)$$

$$E[X^2] = \frac{1}{3(b-a)} (b^3 - a^3)$$

Nous utilisons l'identité remarquable $b^3 - a^3 = (b-a)(b^2 + ab + a^2)$ :

$$E[X^2] = \frac{1}{3(b-a)} (b-a)(b^2 + ab + a^2)$$

Les termes $(b-a)$ s'annulent :

$$E[X^2] = \frac{b^2 + ab + a^2}{3}$$

**3. Substitution dans la formule de la variance**

Maintenant, nous substituons $E[X^2]$ et $E[X]$ dans la formule de la variance :

$$V[X] = \frac{b^2 + ab + a^2}{3} - \left(\frac{a+b}{2}\right)^2$$

$$V[X] = \frac{b^2 + ab + a^2}{3} - \frac{(a+b)^2}{4}$$

$$V[X] = \frac{b^2 + ab + a^2}{3} - \frac{a^2 + 2ab + b^2}{4}$$

**4. Mettre au même dénominateur et simplifier**

Le dénominateur commun est 12 :

$$V[X] = \frac{4(b^2 + ab + a^2) - 3(a^2 + 2ab + b^2)}{12}$$

$$V[X] = \frac{4b^2 + 4ab + 4a^2 - 3a^2 - 6ab - 3b^2}{12}$$

$$V[X] = \frac{b^2 - 2ab + a^2}{12}$$

Nous reconnaissons l'identité remarquable $b^2 - 2ab + a^2 = (b-a)^2$ :

$$V[X] = \frac{(b-a)^2}{12}$$

**5. Résultat final**

Ce qui nous donne la variance pour une loi uniforme :

$$V[X] = \frac{(b-a)^2}{12}$$ 

# TD 5 - Variable aléatoire continues 

# Solution de l'Exercice 1 - TD6

---

**Exercice 1. Dans une colonie de marmottes de Sibérie orientale, on s'intéresse à la durée de vie X d'une marmotte au hasard. On suppose que X suit une loi exponentielle, de paramètre $\lambda = 0.5 \text{ an}^{-1}$.**

---

### 1. Calculez et représentez graphiquement la densité de probabilité f(x) correspondante, puis la fonction de répartition F(x).

#### Étape 1: Rappel des formules pour la loi exponentielle
Une variable aléatoire $X$ qui suit une loi exponentielle de paramètre $\lambda$ a pour :
*   **Fonction de densité de probabilité (PDF)**, notée $f(x)$ :
    $$f(x) = \begin{cases} \lambda e^{-\lambda x} & \text{pour } x \geq 0 \\ 0 & \text{pour } x < 0 \end{cases}$$
*   **Fonction de répartition (CDF)**, notée $F(x)$ :
    $$F(x) = P(X \leq x) = \begin{cases} 1 - e^{-\lambda x} & \text{pour } x \geq 0 \\ 0 & \text{pour } x < 0 \end{cases}$$

#### Étape 2: Application avec $\lambda = 0.5$
Dans notre cas, $\lambda = 0.5$. Nous substituons cette valeur dans les formules.

*   **Fonction de densité de probabilité $f(x)$ :**
    $$f(x) = \begin{cases} 0.5 e^{-0.5 x} & \text{pour } x \geq 0 \\ 0 & \text{pour } x < 0 \end{cases}$$

*   **Fonction de répartition $F(x)$ :**
    $$F(x) = \begin{cases} 1 - e^{-0.5 x} & \text{pour } x \geq 0 \\ 0 & \text{pour } x < 0 \end{cases}$$

#### Étape 3: Représentation graphique (description)

*   **Pour $f(x)$ :**
    *   La fonction $f(x)$ commence à $0.5$ pour $x=0$ (car $e^0=1$).
    *   Elle est décroissante de manière exponentielle et tend vers $0$ lorsque $x$ augmente.
    *   Elle est toujours positive et l'aire totale sous la courbe de $0$ à $\infty$ est égale à $1$.
    *   Graphiquement, cela ressemble à une courbe qui part d'un pic à $x=0$ et descend rapidement sans jamais toucher l'axe des $x$.

*   **Pour $F(x)$ :**
    *   La fonction $F(x)$ est $0$ pour $x < 0$.
    *   Elle commence à $F(0) = 1 - e^0 = 1 - 1 = 0$ pour $x=0$.
    *   Elle est croissante et concave, augmentant de $0$ à $1$ à mesure que $x$ augmente.
    *   Elle tend vers $1$ lorsque $x$ tend vers $\infty$, ce qui signifie que la probabilité que la marmotte vive "au moins" jusqu'à un certain âge devient de plus en plus certaine à mesure que cet âge augmente, atteignant finalement 100%.
    *   Graphiquement, cela ressemble à une courbe en "S" aplatie, partant de $0$, montant progressivement et se stabilisant à $1$.

---

### 2. Quelle est l'espérance de vie d'une marmotte dans la colonie ?

#### Étape 1: Rappel de la formule de l'espérance pour la loi exponentielle
L'espérance $\mathbf{E[X]}$ (ou moyenne) d'une variable aléatoire $X$ suivant une loi exponentielle de paramètre $\lambda$ est donnée par :
$$\mathbf{E[X]} = \frac{1}{\lambda}$$

#### Étape 2: Calcul de l'espérance
Avec $\lambda = 0.5$, nous avons :
$$\mathbf{E[X]} = \frac{1}{0.5} = 2$$

#### Étape 3: Interprétation
L'espérance de vie moyenne d'une marmotte dans cette colonie est de **2 ans**.

---

### 3. Quel âge est atteint par exactement 50% des marmottes de la colonie ?

#### Étape 1: Compréhension de la question
Cette question nous demande de trouver la **médiane** de la distribution. La médiane est la valeur $x_m$ telle que $P(X \leq x_m) = 0.5$. En d'autres termes, $F(x_m) = 0.5$.

#### Étape 2: Utilisation de la fonction de répartition
Nous utilisons la fonction de répartition $F(x) = 1 - e^{-0.5 x}$ et la mettons égale à $0.5$ :
$$1 - e^{-0.5 x_m} = 0.5$$

#### Étape 3: Résolution pour $x_m$
1.  Soustraire 1 des deux côtés :
    $$-e^{-0.5 x_m} = 0.5 - 1$$
    $$-e^{-0.5 x_m} = -0.5$$
2.  Multiplier par -1 :
    $$e^{-0.5 x_m} = 0.5$$
3.  Prendre le logarithme naturel (ln) des deux côtés :
    $$\ln(e^{-0.5 x_m}) = \ln(0.5)$$
    $$-0.5 x_m = \ln(0.5)$$
4.  Calculer $\ln(0.5)$ :
    $$\ln(0.5) \approx -0.693$$
5.  Résoudre pour $x_m$ :
    $$x_m = \frac{-0.693}{-0.5}$$
    $$x_m \approx 1.386$$

#### Étape 4: Interprétation
Environ **1.386 ans** est l'âge atteint par exactement 50% des marmottes de la colonie. Cela signifie que la moitié des marmottes meurent avant cet âge, et l'autre moitié vit plus longtemps.

---

### 4. Probabilités

#### a) Une marmotte vient de naître. Quelle probabilité qu'elle atteigne l'âge de 4 ans ?

#### Étape 1: Formulation de la probabilité
Nous cherchons $P(X \geq 4)$. Pour une variable continue, $P(X \geq 4) = P(X > 4)$.

#### Étape 2: Utilisation de la fonction de répartition (ou de la fonction de queue de la distribution)
Nous savons que $P(X > x) = 1 - F(x) = 1 - (1 - e^{-\lambda x}) = e^{-\lambda x}$.
Donc, $P(X > 4) = e^{-0.5 \cdot 4}$.

#### Étape 3: Calcul
$$P(X > 4) = e^{-2}$$
$$P(X > 4) \approx 0.1353$$

#### Étape 4: Interprétation
La probabilité qu'une marmotte nouveau-née atteigne l'âge de 4 ans est d'environ **13.53%**.

---

#### b) Une marmotte a 10 ans (pile). Quelle probabilité qu'elle atteigne l'âge de 14 ans ?

#### Étape 1: Formulation de la probabilité conditionnelle
Nous cherchons la probabilité que $X > 14$ sachant que $X > 10$. Ceci s'écrit $P(X > 14 | X > 10)$.
La formule générale pour la probabilité conditionnelle est $P(A|B) = \frac{P(A \cap B)}{P(B)}$.
Ici, $A = (X > 14)$ et $B = (X > 10)$. Si $X > 14$, alors il est automatiquement vrai que $X > 10$. Donc, $A \cap B = (X > 14)$.
$$P(X > 14 | X > 10) = \frac{P(X > 14)}{P(X > 10)}$$

#### Étape 2: Calcul des probabilités individuelles
  $P(X > 14) = e^{-0.5 \cdot 14} = e^{-7}$
  $P(X > 10) = e^{-0.5 \cdot 10} = e^{-5}$

#### Étape 3: Calcul de la probabilité conditionnelle
$$P(X > 14 | X > 10) = \frac{e^{-7}}{e^{-5}} = e^{-7 - (-5)} = e^{-7 + 5} = e^{-2}$$
$$P(X > 14 | X > 10) \approx 0.1353$$

#### Étape 4: Interprétation et propriété sans mémoire
La probabilité qu'une marmotte de 10 ans vive jusqu'à 14 ans est d'environ **13.53%**.
Il est important de noter que ce résultat est **identique** à celui de la question 4.a (probabilité qu'une marmotte nouveau-née atteigne 4 ans). Ceci est une caractéristique fondamentale de la loi exponentielle, appelée la **propriété d'absence de mémoire**.

La propriété d'absence de mémoire signifie que la durée de vie future d'un individu (ou le temps d'attente d'un événement) ne dépend pas de son "âge" actuel. Si une marmotte a déjà vécu 10 ans, la probabilité qu'elle vive 4 ans de plus est la même que la probabilité qu'une marmotte nouveau-née vive 4 ans. L'événement passé (avoir vécu 10 ans) n'affecte pas la probabilité des événements futurs.

---

#### c) Plus généralement, expliquez ce que représente la quantité $P(X > x_0 + t | X > x_0)$, et ce qu'elle vaut dans notre modèle. Dans quelles circonstances est-ce réaliste ?

#### Étape 1: Explication de $P(X > x_0 + t | X > x_0)$
Cette quantité représente la probabilité qu'une marmotte vive **au moins $t$ années supplémentaires**, sachant qu'elle a déjà vécu **au moins $x_0$ années**.
*   $x_0$ est l'âge actuel de la marmotte.
*   $t$ est la durée de vie supplémentaire que nous examinons.
*   $x_0 + t$ est l'âge total que la marmotte atteindrait.

#### Étape 2: Valeur dans notre modèle (loi exponentielle)
En utilisant la propriété d'absence de mémoire de la loi exponentielle :
$$P(X > x_0 + t | X > x_0) = \frac{P(X > x_0 + t \text{ et } X > x_0)}{P(X > x_0)}$$
Comme $X > x_0 + t$ implique $X > x_0$, l'intersection est simplement $X > x_0 + t$.
$$P(X > x_0 + t | X > x_0) = \frac{P(X > x_0 + t)}{P(X > x_0)}$$
Nous savons que $P(X > x) = e^{-\lambda x}$.
$$P(X > x_0 + t | X > x_0) = \frac{e^{-\lambda (x_0 + t)}}{e^{-\lambda x_0}}$$
$$P(X > x_0 + t | X > x_0) = e^{-\lambda x_0 - \lambda t + \lambda x_0}$$
$$P(X > x_0 + t | X > x_0) = e^{-\lambda t}$$

Dans notre modèle avec $\lambda = 0.5$, cette probabilité est :
$$P(X > x_0 + t | X > x_0) = e^{-0.5 t}$$

Cette formule montre que la probabilité de vivre $t$ années supplémentaires ne dépend que de $t$ et du paramètre $\lambda$, et non de l'âge déjà atteint $x_0$. C'est la manifestation mathématique de la propriété d'absence de mémoire.

#### Étape 3: Dans quelles circonstances est-ce réaliste ?
La propriété d'absence de mémoire de la loi exponentielle implique que le "taux de défaillance" (ou taux de mortalité) est constant. Autrement dit, le risque de mourir dans la prochaine unité de temps est le même, quel que soit l'âge de l'individu.

**Circonstances où c'est réaliste :**
*   **Phénomènes sans vieillissement ni usure :** La loi exponentielle est souvent utilisée pour modéliser la durée de vie d'appareils électroniques qui ne s'usent pas avec le temps (si un composant est défectueux, il l'est généralement dès le début), ou pour des phénomènes comme la désintégration radioactive, où un atome n'a pas plus de chance de se désintégrer s'il est "vieux".
*   **Périodes de "mortalité constante" :** Dans certains modèles démographiques, la mortalité d'une population peut être approximée par une loi exponentielle pour une certaine tranche d'âge où le taux de mortalité est relativement stable (par exemple, entre l'enfance et la vieillesse avancée chez l'humain).

**Circonstances où ce n'est PAS réaliste (et notamment pour les marmottes) :**
*   **Vieillissement et usure :** Pour les êtres vivants (comme les marmottes) et la plupart des équipements physiques, la propriété d'absence de mémoire n'est généralement pas réaliste. Le risque de mourir augmente avec l'âge (vieillissement) et l'usure. Une marmotte de 10 ans a un risque de mourir beaucoup plus élevé dans les 4 prochaines années qu'une marmotte nouveau-née n'a de mourir avant 4 ans. Les bébés ont une mortalité infantile élevée, puis un taux de mortalité plus faible pendant la jeunesse, qui augmente ensuite avec l'âge.
*   **Périodes de jeunesse/maturité/vieillesse :** Les taux de mortalité ne sont pas constants. Ils sont souvent élevés à la naissance, diminuent pendant la jeunesse, puis augmentent significativement à mesure que l'individu vieillit.

En conclusion, bien que la loi exponentielle soit un modèle utile pour sa simplicité et sa propriété d'absence de mémoire, elle n'est **pas très réaliste** pour modéliser la durée de vie des marmottes ou de tout autre organisme biologique qui vieillit. 

