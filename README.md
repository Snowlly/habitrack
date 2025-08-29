# habitrack

C'est un projet qui permet un suivi quotidien de ses habitudes.


## Getting Started

Ouvrir l'app

```
flutter run
```

Une interface s'ouvre avec deux statistiques :

La première : le nombre total d'habitude.
La deuxième : le nombre d'habitude effectué aujourd'hui

### Les habitudes :

Les habitudes seront affichés avec la possibilité de les cocher pour les valider.
Il existe aussi un sytème de streak (séries) qui prend en compte le moment où une habitude à été cochée, si cette dernière date de la veille et qu'on re-valide notre habitude, cela pasera le streak à 2. 

Exemple : Lundi (sport), Mardi (sport) -> alors le streak passe à 2.


Il y a aussi le possibilité de supprimer une habitude en cliquant sur l'icon de la poubelle.
