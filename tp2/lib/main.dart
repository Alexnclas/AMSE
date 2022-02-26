import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tp2/changeNotifier.dart';
import 'package:tp2/tile.dart';
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
      body:ListView(
        children: [
          Exo1(),
          Exo2(),
          Exo4(),
          Exo5a(),
          Exo5b(),
          Exo5c(),
          Exo6a(),
        ],
      )
    );
  }
}


class Exo1 extends StatelessWidget {
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

//../images/parliamentMothershipConnection.jpg
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

class Exo6a extends StatelessWidget {
  const Exo6a({Key? key}) : super(key: key);
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
                              title: Text("Exercice 6a: Animation tiles"),
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
                  title: Text("Exercice 6a"),
                  subtitle: Text(
                    "Animations tiles",
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



//CLASSES EXERCICE 5c

class MyDividingSlider extends StatefulWidget{
  @override
  createState() => _MyDividingSliderState();
}


class _MyDividingSliderState extends State<MyDividingSlider>{
  @override
  Widget build(BuildContext context){
    final provDiv = Provider.of<sliderDiviserChange>(context);
    return  Slider(
            value: provDiv.valueSlider,
            min:2,
            max: 10,
            divisions: 10,
            label: provDiv.valueSlider.round().toString(),
            onChanged: (double value) {
              setState(() {
                provDiv.valueSlider = value;
              });
            },
          );
  }
}


class MyDivisibleImage extends StatefulWidget{
  @override
  createState() => _MyDivisibleImageState();
}

class _MyDivisibleImageState extends State<MyDivisibleImage>{
  @override
  Widget build(BuildContext context){
    return Consumer<sliderDiviserChange>(
      builder: (context, provDiv, _) => Flexible(
        child: GridView.count(
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: provDiv.valueSlider.round(),
          children:[
            for (var j = 0; j < provDiv.valueSlider.round(); j++)
              for (var i = 0; i < provDiv.valueSlider.round(); i++)
                FittedBox(
                  fit: BoxFit.fill,
                  child: ClipRect(
                    child: Container(
                      child: Align(
                        alignment: Alignment(-1 + (2*i)/(provDiv.valueSlider.round() - 1), -1 + (2*j)/(provDiv.valueSlider.round() - 1)),        //COMMENT TROUVER ALIGNEMENT
                        widthFactor: 1/provDiv.valueSlider.round(),
                        heightFactor: 1/provDiv.valueSlider.round(),
                        child: Image.network('../images/parliamentMothershipConnection.jpg'),
                      ),
                    ),
                  ),
                )
          ],
        ),
      )
    );
  }
}





class MyDivisibleImageV2 extends StatefulWidget{
  @override
  createState() => _MyDivisibleImageV2State();
}

class _MyDivisibleImageV2State extends State<MyDivisibleImageV2>{
  List<TileWidget> tilesTest= [TileWidget(Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, -1), 0.25)),
   TileWidget(Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, -1), 0.25)),
   TileWidget(Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, -1), 0.25)),
   TileWidget(Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, -1), 0.25)),
   TileWidget(Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, -1), 0.25)),
   TileWidget(Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, -1), 0.25)),
   TileWidget(Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, -1), 0.25)),
  ];
  // GameBoard gameBoard = GameBoard(tilesTest);
  @override
  Widget build(BuildContext context){
    return Consumer<tileChangeNotifier>(
      builder: (context, provTile, _) => Flexible(
        child: GridView.count(
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: provTile.valueSlider.round(), //Slider VALUE
          children: [
            for (var j = 0; j < provTile.valueSlider.round(); j++)
              for (var i = 0; i < provTile.valueSlider.round(); i++)
                TileWidget(provTile.tiles[i+j*provTile.valueSlider.round()]),
          ],
        ),
      )
    );
  }
}

class MyDividingSliderV2 extends StatefulWidget{
  @override
  createState() => _MyDividingSliderV2State();
}


class _MyDividingSliderV2State extends State<MyDividingSliderV2>{
  @override
  Widget build(BuildContext context){
    final provTile = Provider.of<tileChangeNotifier>(context);
    return  Slider(
            value: provTile.valueSlider,
            min:2,
            max: 10,
            divisions: 10,
            label: provTile.valueSlider.round().toString(),
            onChanged: (double value) {
              setState(() {
                provTile.valueSlider = value;
                //CHANGEMENT DES TILES
                provTile.tiles = [];
                for (var j = 0; j < provTile.valueSlider.round(); j++)
                  for (var i = 0; i < provTile.valueSlider.round(); i++)
                    provTile.tiles.add(Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1 + (2*i)/(provTile.valueSlider.round() - 1), -1 + (2*j)/(provTile.valueSlider.round() - 1)), 1/provTile.valueSlider.round()));
              });
            },
          );
  }
}

// Possibilité de changer le nombre de tiles en fonction du slider (changeNotifier)
// et de changer les positions des différentes tiles (Gestion de la list dans le change notifier)