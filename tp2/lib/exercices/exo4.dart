import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tp2/changeNotifier.dart';
import 'package:tp2/tile.dart';
import 'package:provider/provider.dart';
import 'package:tp2/exercices/outDatedSliders/providersConsumersV1.dart';


class Exo4 extends StatelessWidget {
  const Exo4({Key? key}) : super(key: key);
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
                            title: Text("Exercice 4: Affichage d'une tuile (un morceau d'image)"),
                          ),
                          body: Center(
                            child: ClipRect(
                              child: Container(
                                child: Align(
                                  alignment: Alignment(0,0),
                                  widthFactor: 0.3,
                                  heightFactor: 0.3,
                                  child: Image.network('../images/parliamentMothershipConnection.jpg'),
                                ),
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
                  title: Text("Exercice 4"),
                  subtitle: Text(
                    "Affichage d'une tuile (un morceau d'image)",
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