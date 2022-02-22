import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tp2/changeNotifier.dart';
import 'package:provider/provider.dart';


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
      body:Column(
        children: [
          Exo1(),
          Exo2(),
          Exo4(),
        ],
      )
    );
  }
}


class Exo1 extends StatelessWidget {//Exercice 1
  const Exo1({Key? key}) : super(key: key);
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
                            title: Text("Exercice 1: Créer un widget image"),
                          ),
                          body: Center(
                            child: Image(image: NetworkImage('../images/parliamentMothershipConnection.jpg')),
                          ),
                        );
                      }
                    )
                  );
                },
                //FIN CONTENU EXERCICE
                //CONTENU CARTE LISTE EXERCICE
                child: ListTile(
                  title: Text("Exercice 1"),
                  subtitle: Text(
                    "Créer un widget image",
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

class Exo2 extends StatelessWidget {//Exercice 2
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
                              // Here we take the value from the MyHomePage object that was created by
                              // the App.build method, and use it to set our appbar title.
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


//../images/parliamentMothershipConnection.jpg
class Exo4 extends StatelessWidget {//Exercice 1
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









//CLASSES EXERCICE 2

class MyChangingImage extends StatefulWidget{
  @override
  createState() => _MyChangingImageState();
}

class _MyChangingImageState extends State<MyChangingImage>{
  @override
  Widget build(BuildContext context){
    return Consumer<animationButtonChange>(
      builder: (context, provAnimation, _) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(color: Colors.white),
        child:Transform(
          alignment: Alignment.topRight,
          transform: Matrix4.identity()
            ..rotateX(3.1415 / (provAnimation.valueSlider1/100))
            ..rotateY(3.1415 / (provAnimation.valueSlider2/100))
            ..scale(provAnimation.valueSlider3/250),
          child: Image(image: NetworkImage('../images/parliamentMothershipConnection.jpg')),
        ),
      ),
    );
  }
}

class MyColumnOfSliders extends StatefulWidget{
  @override
  createState() => _MyColumnOfSlidersState();
}
class _MyColumnOfSlidersState extends State<MyColumnOfSliders>{
  @override
  Widget build(BuildContext context){
    return Consumer<animationButtonChange>(
      builder: (context, provAnimation, _) => Column(
        children: <Widget>[
          Text("RotateX: "),
          Slider(
            value: provAnimation.valueSlider1,
            max: 1000,
            divisions: 1000,
            label: provAnimation.valueSlider1.round().toString(),
            onChanged: (double value) {
              setState(() {
                provAnimation.valueSlider1 = value;
              });
            },
          ),
          Text("RotateY: "),
          Slider(
            value: provAnimation.valueSlider2,
            max: 1000,
            divisions: 1000,
            label: provAnimation.valueSlider2.round().toString(),
            onChanged: (double value) {
              setState(() {
                provAnimation.valueSlider2 = value;
              });
            },
          ),
          Text("Scale: "),
          Slider(
            value: provAnimation.valueSlider3,
            min: 1,
            max: 1000,
            divisions: 1002,
            label: provAnimation.valueSlider3.round().toString(),
            onChanged: (double value) {
              setState(() {
                provAnimation.valueSlider3 = value;
              });
            },
          ),
        ],
      ),
    );
    
  }
}

class MyAnimateButton extends StatefulWidget{
  @override
  createState() => _MyAnimateButtonState();
}


class _MyAnimateButtonState extends State<MyAnimateButton>{
  @override
  Widget build(BuildContext context){
    final provAnimation = Provider.of<animationButtonChange>(context);
    Duration oneMiliSec = Duration(milliseconds: 50);
    return FloatingActionButton(
            onPressed: () {
              if(provAnimation.goOn){
                provAnimation.goOn = false;
              }
              else{
                provAnimation.goOn = true;
              }
              setState(() {
                Timer.periodic(oneMiliSec, (Timer t){
                  if(provAnimation.goOn){
                    if(provAnimation.valueSlider1 > 990){
                    provAnimation.valueSlider1 = 0;
                    }
                    else{
                      provAnimation.valueSlider1 = provAnimation.valueSlider1 + 10;
                    }
                    if(provAnimation.valueSlider2 < 9){
                      provAnimation.valueSlider2 = 1000;
                    }
                    else{
                      provAnimation.valueSlider2 = provAnimation.valueSlider2 - 9;
                    }
                    if(provAnimation.valueSlider3 > 990){
                      provAnimation.valueSlider3 = 250;
                    }
                    else{
                      provAnimation.valueSlider3 = provAnimation.valueSlider3 + 7;
                    }
                  }
                  else{
                    t.cancel();
                  }
                }
                );
              });
            },
            backgroundColor: Colors.green,
            child: Icon(Icons.not_started_outlined),
          );
  }
}





//CLASSES EXERCICE 4
/*  */
