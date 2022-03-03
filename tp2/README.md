# tp2
Partie 2 de l'UV AMSE

## Contenu
Dans cette application, vous trouverez un jeu de taquin, ainsi qu'une liste d'exercice que j'ai du réaliser avant d'arriver à mon objectif (Liste des exercices: https://ceri-num.gitbook.io/uv-amse/tp2#exo-7-jeu-de-taquin).

Pour accéder au jeu de taquin, il vous faut scroll la page jusqu'à arriver à 'Exercice 7: Jeu de Taquin' puis de cliquer sur la flèche à droite.

L'interface se présente ainsi:
- En haut se trouve l'image à reconstituer, mémorisez la bien!
- En dessous se trouve un bouton 'Start Game' permettant de lancer la partie. Ce bouton se transforme en 'New Game' une fois la partie commencée et vous permet de relancer une partie avec la configuration actuelle.
- En dessous du bouton, vous trouverez un compteur de coup qui s'incrémentera lorsque vous déplacerez les tuiles.
- Les paramètres du jeu sont représentés par deux sliders 'Choix du nombre de divisions' et 'Difficulté' allant chacun de 1 à 10. A vous de choisir les paramètres que vous souhaitez. (Difficulté est le paramètre permettant au système de savoir à quel point il devra mélanger le système au début de la partie)
- ATTENTION, si un des sliders est touché lors d'une partie, l'application cosidère que les paramêtres que vous aviez sélectionnés ne vous convenaient pas et décide donc de revenir à l'écran de départ
- Une fois la partie lancée, un bouton 'Undo Last Move' vous permet de revenir en arrière autant de fois que vous le souhaitez. (Votre nombre de coup diminue alors)

## Déroulement d'une partie
Une fois que vous avez choisi vos paramêtres et que vous avez cliqué sur 'Start Game', l'image est alors représentée comme une grillage de tuiles. 
Une des tuiles est sélectionnée aléatoirement par le système et le système mélange l'image (De façon à ce que l'image soit toujours reconstituable).
Vous pouvez alors échanger la tuile selectionnée (Celle qui a une plus grosse bordure que les autres) avec celles qui lui sont adjacentes.
Le but est alors de reconstituer l'image en effectuant le moins de coups que possible.

Une fois l'image reconstituée, la grille disparait et l'image apparait au complet.

L'application vous signale votre victoire ainsi que le nombre de coup qu'il vous a fallu pour résoudre le problème, puis elle revient à l'écran de selection des paramètres et vous pouvez relancer une nouvelle partie.





