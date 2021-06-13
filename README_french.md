## Édition numérique
Ce projet consiste en l'édition en XML TEI d'un extrait du bestiaire d'amour de Richard de Fournival (ff.232v, 233r et 233v), rédigé en ancien français. Le manuscrit est conservé à la Bibliothèque nationale de France au sein du département des Manuscrits et disponible en [version numérisée](https://gallica.bnf.fr/ark:/12148/btv1b84259980).
Cette édition numérique a été réalisée au sein des cours d'XML-tei et d'XSLT dispensés à l'École nationale des chartes dans le cadre du M2 TNAH et a été réalisée par [Axelle Lecroq](https://github.com/axellelecroq) au cours de l'année 2021.

[![plot](img/presentation-site.png)]()

## Les étapes effectuées
1. Transcription du texte en ancien français
2. Encodage en XML-tei:
    - structuration du texte
    - encodage des métadonnées
    - encodage des abréviations et normalisations graphiques de manière à conserver la graphie orginale et à proposer une graphie normalisée
    - indexation des noms de personnages, des animaux et des événements évoqués
3. Création de l'ODD conforme au schéma Relax NG
4. Rédaction d'une documentation HTML afin de présenter les choix d'encodage et les diverses manières dont le projet pourrait être exploité.
5. Visualisation du projet grâce à une transformation XSLT vers HTML

## Structure du dépôt
```
digital-edition-bestiaire
            ├── documentation
            │       ├── le-bestiaire_odd.html
            │       ├── le-bestiaire_odd.rng
            │       └── le-bestiaire_odd.xml
            ├── img/...
            ├── templates
            │       ├── accueil.html
            │       ├── apropos.html
            │       ├── index-event.html
            │       ├── index-personnage.html
            │       ├── index.html
            │       ├── notice.html
            │       └── transcription.ipynb
            ├── .gitignore
            ├── README.md
            ├── README_french.md
            ├── le-bestiaire.xml
            └── le-bestiaire.xsl
```