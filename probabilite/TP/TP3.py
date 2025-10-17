# TP : Chaîne de dominos - Code complet (copiable)
# Implementé en Python 3
# Requirements: numpy, matplotlib, pandas (optionnel pour affichage), collections
# Exemple d'utilisation: lancer ce fichier dans un notebook ou interpreter Python

import random
import collections
import numpy as np
import matplotlib.pyplot as plt
import statistics

# ---------------------------
# Fonctions utilitaires
# ---------------------------

def jeu_complet_double_six():
    """
    Retourne la liste complète des dominos d'un jeu classique double-six.
    Chaque domino est représenté par un tuple (a, b) avec 0 <= a <= b <= 6.
    Il y a 28 dominos.
    """
    dominos = [(i, j) for i in range(7) for j in range(i, 7)]
    return dominos

def peut_poser_sur_bout(domino, bout_val):
    """Renvoie True si le domino peut être posé sur le bout dont la valeur visible est bout_val."""
    a, b = domino
    return (a == bout_val) or (b == bout_val)

def poser_domino_sur_bout(domino, bout, left_end, right_end):
    """
    Pose 'domino' sur le bout 'left' ou 'right' et renvoie les nouveaux left_end et right_end.
    'bout' doit être 'left' ou 'right'.
    L'orientation du domino n'est pas gardée, on ne retient que la nouvelle valeur du bout posé.
    """
    a, b = domino
    if bout == 'left':
        # Si on pose à gauche, la nouvelle left_end devient l'autre valeur du domino qui n'est pas égale à l'ancien left_end
        # S'il y a double on garde la même valeur
        if a == left_end and b == left_end:
            new_left = left_end
        elif a == left_end:
            new_left = b
        elif b == left_end:
            new_left = a
        else:
            # logique defensive, devra pas arriver si on vérifie avant
            new_left = left_end
        return new_left, right_end
    elif bout == 'right':
        if a == right_end and b == right_end:
            new_right = right_end
        elif a == right_end:
            new_right = b
        elif b == right_end:
            new_right = a
        else:
            new_right = right_end
        return left_end, new_right
    else:
        raise ValueError("bout doit être 'left' ou 'right'")

# ---------------------------
# Fonction principale de simulation d'une partie
# ---------------------------

def une_chaine_domino(random_seed=None):
    """
    Simule une partie complète selon les règles décrites dans l'énoncé.
    Retourne (X, Y) où:
      - X = nombre de dominos posés dans la chaîne
      - Y = nombre de points restants dans la pioche (somme des pips des dominos non posés)
    Règles implémentées :
      - On mélange la pioche (on la représente par une deque).
      - On tire le premier domino pour démarrer la chaîne.
      - Ensuite on effectue des passes sur la pioche : pour chaque domino tiré (on l'enlève du début),
        si posable sur left ou right on le pose (choisit aléatoirement le côté si les deux possibles),
        sinon on le remet à la fin de la pioche.
      - On s'arrête lorsqu'une passe entière ne permet de poser aucun domino.
    """
    if random_seed is not None:
        random.seed(random_seed)
        np.random.seed(random_seed)

    # Préparation du jeu
    deck = jeu_complet_double_six()[:]  # copie
    random.shuffle(deck)
    deck = collections.deque(deck)

    # Démarrer la chaîne avec le premier tirage
    if not deck:
        return 0, 0
    first = deck.popleft()
    # Le plateau ne garde que les deux valeurs visibles aux extrémités
    left_end, right_end = first  # orientation arbitraire pour le départ
    # Si first = (a,b), alors left_end=a, right_end=b ; c'est suffisant pour la simulation.
    X = 1  # nombre posés
    # Main loop: on effectue des passes sur la deque
    while True:
        placed_in_pass = False
        n_start_pass = len(deck)
        # Si la pioche est vide, on a placé tous les dominos -> fin
        if n_start_pass == 0:
            break
        # On parcourt exactement n_start_pass dominos (les autres ajoutés à la fin lors de cette passe ne seront pas traités dans cette passe)
        for _ in range(n_start_pass):
            tile = deck.popleft()
            can_left = peut_poser_sur_bout(tile, left_end)
            can_right = peut_poser_sur_bout(tile, right_end)
            if can_left and can_right:
                # Choisir au hasard un côté
                chosen = random.choice(['left', 'right'])
                left_end, right_end = poser_domino_sur_bout(tile, chosen, left_end, right_end)
                X += 1
                placed_in_pass = True
            elif can_left:
                left_end, right_end = poser_domino_sur_bout(tile, 'left', left_end, right_end)
                X += 1
                placed_in_pass = True
            elif can_right:
                left_end, right_end = poser_domino_sur_bout(tile, 'right', left_end, right_end)
                X += 1
                placed_in_pass = True
            else:
                # on remet à la fin de la pioche
                deck.append(tile)
        # fin de la passe
        if not placed_in_pass:
            # aucune pose durant une passe complète -> on ne peut plus poser de dominos
            break

    # Calculer Y = nombre de points restants dans la pioche
    Y = sum(a + b for (a, b) in deck)
    return X, Y

# ---------------------------
# Analyse statistique (Exercice 3 et 4)
# ---------------------------

def simuler_n_parties(n, random_seed=None):
    """
    Simule n parties et renvoie deux tableaux numpy: Xs et Ys.
    """
    Xs = np.empty(n, dtype=int)
    Ys = np.empty(n, dtype=int)
    # Pour reproductibilité on peut paramétrer la seed puis tirer des seeds pour chaque partie
    base_rng = random.Random(random_seed)
    for i in range(n):
        # tirer une seed par partie pour varier les tirages
        seed_i = base_rng.randint(0, 2**30 - 1) if random_seed is not None else None
        x, y = une_chaine_domino(random_seed=seed_i)
        Xs[i] = x
        Ys[i] = y
    return Xs, Ys

def analyser_et_tracer(Xs, Ys, afficher_graphs=True):
    """
    Calcule et affiche les estimations demandées:
      - loi de probabilité empirique de X (histogramme)
      - fonction de répartition empirique de X
      - estimations d'espérance et variance pour X et Y
      - probabilité de succès (X == 28)
      - médiane de Y
      - covariance et coefficient de corrélation
      - scatter plot pour un échantillon (200)
    """
    n = len(Xs)
    print(f"Nombre de simulations : {n}")
    # Lois empiriques
    # Distribution de X
    values_X, counts_X = np.unique(Xs, return_counts=True)
    probs_X = counts_X / n
    # Empirical CDF for X
    sorted_unique = np.sort(values_X)
    cdf_vals = np.cumsum(probs_X)

    # Estimations
    mean_X = np.mean(Xs)
    var_X = np.var(Xs, ddof=1)  # estimateur non biaisé
    mean_Y = np.mean(Ys)
    var_Y = np.var(Ys, ddof=1)

    prob_success = np.mean(Xs == 28)
    median_Y = np.median(Ys)

    # Covariance et correlation
    cov_XY = np.cov(Xs, Ys, ddof=1)[0, 1]
    corrcoef = np.corrcoef(Xs, Ys)[0, 1]

    print("\n--- Résultats numériques ---")
    print(f"E[X] ≈ {mean_X:.4f}, Var(X) ≈ {var_X:.4f}")
    print(f"E[Y] ≈ {mean_Y:.4f}, Var(Y) ≈ {var_Y:.4f}")
    print(f"Probabilité de succès (tous les dominos posés) : P(X=28) ≈ {prob_success:.6f}")
    print(f"Médiane de Y ≈ {median_Y:.4f}")
    print(f"Cov(X, Y) ≈ {cov_XY:.4f}")
    print(f"Coefficient de corrélation ρ(X,Y) ≈ {corrcoef:.4f}")

    # Vérification indépendance (approx) : E[XY] ?= E[X]E[Y]
    E_XY = np.mean(Xs * Ys)
    print(f"E[X*Y] ≈ {E_XY:.4f}, E[X]E[Y] ≈ {mean_X * mean_Y:.4f}")
    if abs(E_XY - mean_X * mean_Y) > 1e-6:
        print("=> X et Y ne sont probablement pas indépendantes (E[XY] != E[X]E[Y]).")
    else:
        print("=> Aucune preuve de dépendance via cette comparaison (rarement exact).")

    # Graphiques
    if afficher_graphs:
        plt.figure(figsize=(10, 4))
        # histogramme de X (loi de probabilité)
        plt.subplot(1, 3, 1)
        plt.bar(values_X, probs_X, width=0.7)
        plt.title("Loi empirique de X (# dominos posés)")
        plt.xlabel("X")
        plt.ylabel("Probabilité")
        plt.grid(axis='y', alpha=0.3)

        # Fonction de répartition empirique de X
        plt.subplot(1, 3, 2)
        plt.step(values_X, np.cumsum(probs_X), where='post')
        plt.title("Fonction de répartition empirique de X")
        plt.xlabel("X")
        plt.ylabel("F_X(x)")
        plt.grid(True)

        # Histogramme de Y (densité empirique)
        plt.subplot(1, 3, 3)
        plt.hist(Ys, bins=20)
        plt.title("Histogramme de Y (points restants)")
        plt.xlabel("Y")
        plt.ylabel("Fréquence")
        plt.grid(True)

        plt.tight_layout()
        plt.show()

        # Nuage de points pour 200 réalisations (exercice 4)
        m = min(200, n)
        sample_indices = np.random.choice(n, size=m, replace=False)
        plt.figure(figsize=(6, 5))
        plt.scatter(Xs[sample_indices], Ys[sample_indices], alpha=0.7, s=20)
        plt.title(f"Nuage de points (X vs Y) pour {m} réalisations")
        plt.xlabel("X (nombre dominos posés)")
        plt.ylabel("Y (points restants)")
        plt.grid(True)
        plt.show()

    # Retourner valeurs utiles au besoin
    results = {
        'n': n,
        'values_X': values_X,
        'probs_X': probs_X,
        'cdf_X': (values_X, np.cumsum(probs_X)),
        'mean_X': mean_X,
        'var_X': var_X,
        'mean_Y': mean_Y,
        'var_Y': var_Y,
        'prob_success': prob_success,
        'median_Y': median_Y,
        'cov_XY': cov_XY,
        'corrcoef': corrcoef,
        'E_XY': E_XY
    }
    return results

# ---------------------------
# Script principal: exécution des simulations demandées
# ---------------------------

if __name__ == "__main__":
    # Paramètres
    N_simulations = 20000  # >= 10000 demandé ; ajustez si vous voulez plus / moins
    seed = 12345  # pour reproductibilité (mettre None pour aléa complet)

    # Simuler
    print("Lancement des simulations... (cela peut prendre quelques secondes selon N_simulations)")
    Xs, Ys = simuler_n_parties(N_simulations, random_seed=seed)

    # Analyse et tracés
    res = analyser_et_tracer(Xs, Ys, afficher_graphs=True)

    # Afficher quelques informations supplémentaires rapides
    # Par exemple, distribution complète de X (sous forme tabulaire)
    print("\nDistribution empirique complète de X (valeur : probabilité) :")
    for v, p in zip(res['values_X'], res['probs_X']):
        print(f"  X = {v} : P ≈ {p:.6f}")

    # Recherche du nombre maximum et minimum posés observés
    print(f"\nX min observé = {int(np.min(Xs))}, X max observé = {int(np.max(Xs))}")

    # Fin
    print("\nFin des calculs. Vous pouvez modifier N_simulations ou seed en tête de ce script.")



    