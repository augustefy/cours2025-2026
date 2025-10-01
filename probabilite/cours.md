# TD5 - Variable aléatoire continues 

Une variable aléatoire $X$ est dite continue s’il existe une fonction $f : \mathbb{R} \to \mathbb{R}$, appelée densité de probabilité, telle que pour tout intervalle réel $[a, b]$ :
$$
P(a \leq X \leq b) = \int_{a}^{b} f(x)\,dx
$$

La fonction ƒ s’appelle la densité de probabilité de $X$.

---

## Fiche Méthode : Variables Aléatoires Continues

### 1. Qu'est-ce qu'une variable aléatoire continue ?

*   C'est une variable dont les valeurs peuvent être n'importe quel nombre dans un intervalle (par exemple, la taille d'une personne, le temps d'attente à un arrêt de bus).
*   Contrairement aux variables discrètes (qui ont des valeurs distinctes comme le résultat d'un dé), ici, il y a une infinité de valeurs possibles entre deux points.

### 2. Le rôle de la fonction de densité de probabilité (**f(x)**)

*   Pour les variables continues, on ne parle **pas de la probabilité d'une valeur exacte** (elle est toujours de 0).
*   On parle plutôt de la probabilité que la variable se trouve dans un certain intervalle.
*   C'est là qu'intervient la fonction de densité de probabilité, notée \(f(x)\). Elle nous aide à calculer ces probabilités.

### 3. Comment calculer la probabilité d'un intervalle ?

*   Pour trouver la probabilité que notre variable aléatoire \(X\) se trouve entre deux valeurs \(a\) et \(b\) (c'est-à-dire \(P(a \leq X \leq b)\)), on utilise une **intégrale**.
*   L'intégrale de la fonction de densité \(f(x)\) entre \(a\) et \(b\) nous donne cette probabilité.
    $$P(a \leq X \leq b) = \int_{a}^{b} f(x)\,dx$$
*   **En mots simples :** C'est l'aire sous la courbe de la fonction \(f(x)\) entre les points \(a\) et \(b\).

### 4. Propriétés importantes de **f(x)** :

*   La fonction \(f(x)\) doit toujours être **positive ou nulle** (\(f(x) \geq 0\)). Une probabilité ne peut pas être négative !
*   L'aire totale sous la courbe de \(f(x)\) sur tout l'axe des nombres réels doit être **égale à 1**. C'est logique, car la somme de toutes les probabilités possibles doit faire 100%. \(\left(\int_{-\infty}^{\infty} f(x)\,dx = 1\right)\).

### 5. Cas particulier : La loi uniforme continue

Lorsqu'une variable aléatoire continue $X$ suit une loi uniforme sur l'intervalle $[a, b]$, cela signifie que toutes les valeurs de cet intervalle ont la même "densité" de probabilité d'apparition. Sa fonction de densité de probabilité $f(x)$ est définie comme suit :

$$f(x) = \begin{cases}
\frac{1}{b-a} & \text{pour } a \leq x \leq b \\
0 & \text{ailleurs}
\end{cases}$$

---

## Démonstration de l'espérance mathématique pour une loi uniforme

Pour une variable aléatoire continue $X$ suivant une loi uniforme sur l'intervalle $[a, b]$, l'espérance mathématique $E[X]$ (la moyenne) est donnée par :

$$E[X] = \frac{a+b}{2}$$

Voici la démonstration étape par étape :

**1. Formule générale de l'espérance pour une variable continue**

L'espérance $E[X]$ d'une variable aléatoire continue est définie par l'intégrale de $x$ multiplié par sa fonction de densité de probabilité $f(x)$ sur tout l'ensemble des réels :

$$E[X] = \int_{-\infty}^{\infty} x \cdot f(x)\,dx$$

**2. Application à la loi uniforme**

Pour une loi uniforme sur $[a, b]$, la fonction $f(x)$ est non nulle (et égale à $\frac{1}{b-a}$) uniquement entre $a$ et $b$. L'intégrale se simplifie donc à l'intervalle $[a, b]$ :

$$E[X] = \int_{a}^{b} x \cdot \frac{1}{b-a}\,dx$$

**3. Sortir la constante de l'intégrale**

$\\frac{1}{b-a}$ est une constante, nous pouvons donc la sortir de l'intégrale :

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

Pour une variable aléatoire continue $X$ suivant une loi uniforme sur l'intervalle $[a, b]$, la variance $V[X]$ est donnée par :

$$V[X] = \frac{(b-a)^2}{12}$$

Voici la démonstration étape par étape :

**1. Formule générale de la variance**

La variance $V[X]$ d'une variable aléatoire continue est définie par la formule :

$$V[X] = E[X^2] - (E[X])^2$$

Nous avons déjà calculé $E[X] = \frac{a+b}{2}$. Nous devons maintenant calculer $E[X^2]$.

**2. Calcul de $E[X^2]$ pour une loi uniforme**

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


