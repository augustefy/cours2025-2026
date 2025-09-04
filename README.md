Cours 2025–2026 (Markdown)
===========================

[![Statut](https://img.shields.io/badge/statut-en%20cours-1e90ff?style=for-the-badge)](#)
[![Année](https://img.shields.io/badge/année-2025–2026-2ecc71?style=for-the-badge)](#)
[![Format](https://img.shields.io/badge/format-Markdown-f39c12?style=for-the-badge)](#)
[![Langue](https://img.shields.io/badge/langue-Français-9b59b6?style=for-the-badge)](#)

---

Ce dépôt contient mes notes de cours, exercices et supports divers pour l'année 2025–2026, rédigés en Markdown. Il sera mis à jour régulièrement. Les contributions (corrections, ajouts, propositions d'exercices) sont les bienvenues via issues et pull requests.

Structure du dépôt
------------------

- `analyse/` : notes et exercices liés à l'analyse
- `methodesAgiles/` : fiches et ressources sur les méthodologies agiles
- `devEfficace/` : bonnes pratiques, outillage et efficacité en développement

Objectifs
---------

- Centraliser des notes de cours en un seul endroit (Markdown)
- Proposer des exercices et QCM lorsque pertinent
- Garder une trace claire de l'évolution des contenus (Git)

Pré-requis et lecture
---------------------

- Markdown peut être lu directement sur GitHub/GitLab ou dans votre éditeur (VS Code, Cursor, etc.) avec prévisualisation.
- Pour une conversion locale en HTML/PDF, vous pouvez utiliser `pandoc` (optionnel).

Exemples de compilation (optionnel)
-----------------------------------

Avec `pandoc` installé :

```bash
# Vers HTML
pandoc methodesAgiles/methodesAgiles.md -o _build/methodesAgiles.html --standalone --toc

# Vers PDF (nécessite une distribution LaTeX, ex. TeX Live)
pandoc methodesAgiles/methodesAgiles.md -o _build/methodesAgiles.pdf --pdf-engine=xelatex --toc
```

Notes
-----

- Le dossier `_build/` n'est pas obligatoire ; créez-le si vous générez des artefacts.
- Les chemins ci-dessus sont des exemples ; adaptez selon le fichier à convertir.

Conventions d'écriture
----------------------

- Un fichier par chapitre/séance lorsque possible
- Titres hiérarchisés (`#`, `##`, `###`)
- Listes concises, exemples exécutables, liens vers ressources
- Illustrations placées dans un sous-dossier `images/` à côté des notes concernées

Contribuer
----------

1. Fork puis branche de travail :
   ```bash
   git checkout -b amelioration/sujet-x
   ```
2. Faites des commits atomiques et descriptifs
3. Ouvrez une pull request avec un résumé clair (quoi/pourquoi)
4. Signalez les erreurs via des issues si vous ne proposez pas de correctif directement

Crédits et inspiration
----------------------

Inspiré par des dépôts de cours publics (ex. cours de systèmes informatiques) et adapté à un flux de travail Markdown simple.


