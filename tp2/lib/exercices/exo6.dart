import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tp2/changeNotifier.dart';
import 'package:tp2/tile.dart';
import 'package:provider/provider.dart';
import 'package:tp2/exercices/outDatedSliders/providersConsumersV1.dart';
import 'package:tp2/exercices/outDatedSliders/providersConsumersV2.dart';
import 'package:tp2/exercices/outDatedSliders/providersConsumersV3.dart';

class Exo6 extends StatelessWidget {
  const Exo6({Key? key}) : super(key: key);
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
                              title: Text("Exercice 6: Swappable tiles"),
                            ),
                            body: Center(
                              child: Column(
                                children:[
                                  MyDivisibleImageV2(),    
                                  MyDividingSliderV2(),
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
                  title: Text("Exercice 6"),
                  subtitle: Text(
                    "Swappable tiles",
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
