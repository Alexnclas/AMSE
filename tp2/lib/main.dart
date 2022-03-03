import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tp2/changeNotifier.dart';
import 'package:tp2/tile.dart';
import 'package:provider/provider.dart';

import 'package:tp2/exercices/exo1.dart';
import 'package:tp2/exercices/exo2.dart';
import 'package:tp2/exercices/exo4.dart';
import 'package:tp2/exercices/exo5.dart';
import 'package:tp2/exercices/exo6.dart';



void main() {
  runApp(
    MaterialApp(
      title: 'TP2',
      home: ListeExos(),
    ),
  );
}

class ListeExos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des exercices'),
      ),
      body:ListView(
        children: [
          Exo1(),
          Exo2(),
          Exo4(),
          Exo5a(),
          Exo5b(),
          Exo5c(),
          Exo6(),
          Exo7(),
        ],
      )
    );
  }
}


class Exo7 extends StatelessWidget {
  const Exo7({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context){
                        //CONTENU EXERCICE
                        return ChangeNotifierProvider(
                          create: (context) => tileChangeNotifier(),
                          child: Scaffold(
                            appBar: AppBar(
                              title: Text("Exercice 7: Jeu de taquin"),
                            ),
                            body: Center(
                              child: Column(
                                children:[
                                  Container(
                                    margin: const EdgeInsets.all(10.0),
                                    width: 250.0,
                                    height: 250.0,
                                    child: MyTaquinBoard(),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          MyMoveCounter(),
                                          MyStartButton(),
                                        ]
                                      ),
                                      Text("Choix du nombre de divisions: "),
                                      MySizeSlider(),
                                      Text("Choix de la difficulté: "),
                                      MyDifficultySlider(),
                                    ]
                                  ),
                                ],
                              ),
                          ),
                          ),
                        );
                      }
                    )
                  );
                },
                //FIN CONTENU EXERCICE
                //CONTENU CARTE LISTE EXERCICE
                child: ListTile(
                  title: Text("Exercice 7"),
                  subtitle: Text(
                    "Jeu de taquin",
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.blue,
                    semanticLabel: "Lancer l'exercice",
                  ),
                ),
              ),
            ),
          );
    }
}


class MyTaquinBoard extends StatefulWidget{
  @override
  createState() => _MyTaquinBoardState();
}

class _MyTaquinBoardState extends State<MyTaquinBoard>{
  String imgSrc = '../images/parliamentMothershipConnection.jpg';



  @override
  Widget build(BuildContext context){
    return Consumer<tileChangeNotifier>(
      builder: (context, provTile, _) =>GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: provTile.sizeGameboard.round(), //Slider VALUE
          children: [
              //DEPLACEMENT DES TILES
             for (int r = 0; r < provTile.nbRows; r += 1)
                for (int c = 0; c < provTile.nbCols; c += 1)   //ON CONSIDERE QUE TILES A LE MEME NOMBRE DE LIGNES ET DE COLONNES
                  GestureDetector(
                    onTap: (){
                      setState((){
                        provTile.swapTiles(r, c);
                      });
                    },
                    child: TileWidget(provTile.tiles[r][c]),
                    )
          ],
        ),
    );
  }
}


class MyMoveCounter extends StatefulWidget{
  @override
  createState() => _MyMoveCounterState();
}


class _MyMoveCounterState extends State<MyMoveCounter>{



  @override
  Widget build(BuildContext context){
    return Consumer<tileChangeNotifier>(
      builder: (context, provTile, _) => Column(
        children: [
          Text("Coups Joués: "),
          Text(provTile.nbMoves.toString())
        ],
      )
    );
  }
}




class MyStartButton extends StatefulWidget{
  @override
  createState() => _MyStartButtonState();
}


class _MyStartButtonState extends State<MyStartButton>{

  String imgSrc = '../images/parliamentMothershipConnection.jpg';

  @override
  Widget build(BuildContext context){
    return Consumer<tileChangeNotifier>(
      builder: (context, provTile, _) => ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    provTile.resetTiles(imgSrc, provTile.sizeGameboard.round(), provTile.sizeGameboard.round());
                    provTile.scramble();
                  },
                  child: const Text('Lancer la partie'),
                ),
              ],
            ),
          )
    );
  }
}


class MySizeSlider extends StatefulWidget{
  @override
  createState() => _MySizeSliderState();
}


class _MySizeSliderState extends State<MySizeSlider>{
  String imgSrc = '../images/parliamentMothershipConnection.jpg';
  @override
  Widget build(BuildContext context){
    final provTile = Provider.of<tileChangeNotifier>(context);
    return  Slider(
            value: provTile.sizeGameboard,
            min:2,
            max: 10,
            divisions: 10,
            label: provTile.sizeGameboard.round().toString(),
            onChanged: (double value) {
              setState(() {
                provTile.sizeGameboard = value;
                provTile.resetTiles(imgSrc, provTile.sizeGameboard.round(), provTile.sizeGameboard.round());
              });
            },
          );
  }
}

class MyDifficultySlider extends StatefulWidget{
  @override
  createState() => _MyDifficultySliderState();
}


class _MyDifficultySliderState extends State<MyDifficultySlider>{
  @override
  Widget build(BuildContext context){
    final provTile = Provider.of<tileChangeNotifier>(context);
    return  Slider(
            value: provTile.difficulte,
            min:1,
            max: 10,
            divisions: 10,
            label: provTile.difficulte.round().toString(),
            onChanged: (double value) {
              setState(() {
                provTile.difficulte = value;
              });
            },
          );
  }
}



// METTRE LE TAQUIN DANS UNE ZONE (PLUS DE SCROLLABLE)   OK
// COMPTEUR DE DEPLACEMENT ok
// SCRAMBLE  (CALL PLUSIEURS FOIS LE SWAP) ok 
// DIFFICULTEE SCRAMBLE ok 
// ANNULER LE DERNIER COUP JOUEE (COPIE DU TABLEAU A CHAQUE UPDATE) 
// VERIFIER QUE LE TABLEAU N'EST PAS WIN A LA FIN DU SCRAMBLE

// BLOQUER LES PARAMETRES LORSQUE LA PARTIE EST EN COURS

// INDIQUER LORSQUE LE JOUEUR A GAGNE (AFFICHER L'IMAGE SANS GRIDVIEW)

// (CHOIX IMAGE)

// CLEAN UP CODE
//GITHUB + README