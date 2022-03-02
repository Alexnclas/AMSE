import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tp2/changeNotifier.dart';
import 'package:tp2/tile.dart';
import 'package:provider/provider.dart';
import 'package:tp2/exercices/outDatedSliders/providersConsumersV1.dart';

class Exo2 extends StatelessWidget {
  const Exo2({Key? key}) : super(key: key);
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
                          create: (context) => animationButtonChange(),
                          child: Scaffold(
                            appBar: AppBar(
                              title: Text("Exercice 2: Image Animée"),
                            ),
                            body: Center(
                              // Center is a layout widget. It takes a single child and positions it
                              // in the middle of the parent.
                              child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(16.0),
                                    ),
                                    MyChangingImage(),
                                    Padding(
                                      padding: EdgeInsets.all(16.0),
                                    ),
                                    MyColumnOfSliders(),
                                  ],
                                ),
                            ),
                            floatingActionButton: MyAnimateButton(),
                          )
                        );
                      }
                    )
                  );
                },
                //FIN CONTENU EXERCICE
                //CONTENU CARTE LISTE EXERCICE
                child: ListTile(
                  title: Text("Exercice 2"),
                  subtitle: Text(
                    "Image animée",
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
