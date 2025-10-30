# Manipulation des BDD en PHP
## Couche de persistnace 
Une application web est généralement basée sur une architecture 3 tiers 

utilisateur -> couche utilisateur <-> couche métier <-> couche de persistance

## Manipulation de Bd en php 

- ne pas utiliser les mots clés mysql_ (pour eviter les attaques type inj. SQL)
- Utiliser le PDO (PHP Data Object)
    - Permet d'éviter les injections SQL
    - Obligatpire en PHP>=7

### 2 mots sur les injections SQL 

Attaque (bien répendue) de site web (malprotégés)

Exemple : 

## Intro au DAL (Data Access Layer)
- couche d'accés au données (DAL)
- couche gerer les données à la sauce Objet 
    - permet de gérer les data objet 

    - Table Data Gateway



```mermaid
sequenceDiagram
  autonumber
  participant V as Vue (Form)
  participant B as Navigateur
  participant F as FrontController
  participant R as AltoRouter
  participant C as UserController
  participant S as Service/Modèle
  participant T as Template/Vue

  V->>B: Submit POST /user/updateProfile (form data + CSRF)
  B->>F: Requête HTTP
  F->>R: match()
  R-->>F: {target: UserController, action: updateProfile}
  F->>F: Contrôle d'accès (session/role)
  alt Accès refusé
    F-->>B: 401/403 (ou redirection vers login)
  else OK
    F->>C: new UserController();
    F->>C: call updateProfile(params)
    C->>C: Validation (CSRF, données)
    alt Données invalides
      C-->>T: Rendu vue avec erreurs
      T-->>B: HTML (400/422)
    else Valide
      C->>S: Appel logique métier (update)
      S-->>C: Succès/échec
      alt Succès (PRG)
        C-->>B: Redirect 302 vers /user/seeProfile
        B->>F: GET /user/seeProfile
        F->>R: match() ⇒ seeProfile
        F->>C: call seeProfile()
        C-->>T: Rendu profil (flash "succès")
        T-->>B: HTML 200
      else Échec serveur
        C-->>F: throw Exception
        F-->>B: 500 + page d'erreur
      end
    end
  end
```