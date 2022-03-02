import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tp2/changeNotifier.dart';
import 'package:tp2/tile.dart';
import 'package:provider/provider.dart';
import 'package:tp2/exercices/outDatedSliders/providersConsumersV1.dart';
import 'package:tp2/exercices/outDatedSliders/providersConsumersV2.dart';

class Exo5a extends StatelessWidget {
  const Exo5a({Key? key}) : super(key: key);
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
                        return Scaffold(
                          appBar: AppBar(
                            title: Text("Exercice 5a: Grille"),
                          ),
                          body: Center(
                            child: GridView.count(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 3,
                              children:[
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(10.0),
                                  color:Colors.amber[100],
                                  child:Text("Tile 1")
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(10.0),
                                  color:Colors.amber[200],
                                  child:Text("Tile 2")
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(10.0),
                                  color:Colors.amber[300],
                                  child:Text("Tile 3")
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(10.0),
                                  color:Colors.amber[400],
                                  child:Text("Tile 4")
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(10.0),
                                  color:Colors.amber[500],
                                  child:Text("Tile 5")
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(10.0),
                                  color:Colors.amber[400],
                                  child:Text("Tile 6")
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(10.0),
                                  color:Colors.amber[300],
                                  child:Text("Tile 7")
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(10.0),
                                  color:Colors.amber[200],
                                  child:Text("Tile 8")
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(10.0),
                                  color:Colors.amber[100],
                                  child:Text("Tile 9")
                                ),
                              ],
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
                  title: Text("Exercice 5a"),
                  subtitle: Text(
                    "Génération d'un plateau de tuiles",
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

class Exo5b extends StatelessWidget {
  const Exo5b({Key? key}) : super(key: key);
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
                        return Scaffold(
                          appBar: AppBar(
                            title: Text("Exercice 5b: Grille (Image)"),
                          ),
                          body: Center(
                            child: GridView.count(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 3,
                              children:[
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: ClipRect(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment(-1,-1),
                                        widthFactor: 0.3,
                                        heightFactor: 0.3,
                                        child: Image.network('../images/parliamentMothershipConnection.jpg'),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: ClipRect(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment(0,-1),
                                        widthFactor: 0.3,
                                        heightFactor: 0.3,
                                        child: Image.network('../images/parliamentMothershipConnection.jpg'),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: ClipRect(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment(1,-1),
                                        widthFactor: 0.3,
                                        heightFactor: 0.3,
                                        child: Image.network('../images/parliamentMothershipConnection.jpg'),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: ClipRect(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment(-1, 0),
                                        widthFactor: 0.3,
                                        heightFactor: 0.3,
                                        child: Image.network('../images/parliamentMothershipConnection.jpg'),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: ClipRect(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment(0, 0),
                                        widthFactor: 0.3,
                                        heightFactor: 0.3,
                                        child: Image.network('../images/parliamentMothershipConnection.jpg'),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: ClipRect(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment(1,0),
                                        widthFactor: 0.3,
                                        heightFactor: 0.3,
                                        child: Image.network('../images/parliamentMothershipConnection.jpg'),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: ClipRect(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment(-1, 1),
                                        widthFactor: 0.3,
                                        heightFactor: 0.3,
                                        child: Image.network('../images/parliamentMothershipConnection.jpg'),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: ClipRect(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment(0, 1),
                                        widthFactor: 0.3,
                                        heightFactor: 0.3,
                                        child: Image.network('../images/parliamentMothershipConnection.jpg'),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: ClipRect(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment(1, 1),
                                        widthFactor: 0.3,
                                        heightFactor: 0.3,
                                        child: Image.network('../images/parliamentMothershipConnection.jpg'),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                  title: Text("Exercice 5b"),
                  subtitle: Text(
                    "Génération d'un plateau de tuiles (Image)",
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

class Exo5c extends StatelessWidget {
  const Exo5c({Key? key}) : super(key: key);
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
                          create: (context) => sliderDiviserChange(),
                          child: Scaffold(
                            appBar: AppBar(
                              title: Text("Exercice 5c: Grille configuration taille (Image)"),
                            ),
                            body: Center(
                              child: Column(
                                children:[
                                  MyDivisibleImage(),
                                  MyDividingSlider(),    
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
                  title: Text("Exercice 5c"),
                  subtitle: Text(
                    "Grille configuration taille (Image)",
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