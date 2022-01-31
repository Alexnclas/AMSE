import 'package:flutter/material.dart';
//Attention j'ai changé la version du sdk necessaire dans le pubspec.yaml
void main() {
  runApp(const MyApp());
}

//Style des pages
const TextStyle optionStyle =  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
final Color couleurNavbar = Colors.red;


//Objets a recenser (Classes)
class MediaModel {
  String imageUrl = "";
  String title  = "";
  String genre = "";
  String description  = "";
  //Constructor
  MediaModel(imgU, t, g, d){
    this.imageUrl = imgU;
    this.title = t;
    this.genre = g;
    this.description = d;
    }
  bool operator ==(other) {
    if (other is MediaModel) {
      /* print(other.title);
      print(this.title);
      print(this.title == other.title); */
      return this.title == other.title;
    } else {
      return false;
    }
  }
}
//Objets a recenser (Examples) TROUVER DES IMAGES DE LA TAILLE DE MAGGOT BRAIN
final exampleSongs = [
  MediaModel("../images/Albums/parliamentMothershipConnection.jpg", "Parliament - Give Up The Funk", "Funk", "Description 1"),
  MediaModel("../images/Albums/funkadelicMaggotBrain.jpg", "Funkadelic - Maggot Brain", "Funk", "Description 2"),
  MediaModel("../images/Albums/frankOceanChannelOrange.jpeg", "Frank Ocean - Super Rich Kids", "R&B, Soul", "Description 3"),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Médiathèque (TP1)',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyStatefulPage(),
    );
  }
}

class MyStatefulPage extends StatefulWidget {
  const MyStatefulPage({Key? key}) : super(key: key);

  @override
  State<MyStatefulPage> createState() => _MyStatefulPageState();
}



class _MyStatefulPageState extends State<MyStatefulPage> {
  //Page choisie
  int _selectedIndex = 0;
  
  
  ///Liste des pages
  static List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    MyStatefulMusicPage(),
    MyAboutPage(),
    MyFavorites(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Médiathèque'),  //TEXTE TITRE BARRE DU HAUTE
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: couleurNavbar,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack),
            label: 'Music',
            backgroundColor: couleurNavbar,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
            backgroundColor: couleurNavbar,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            backgroundColor: couleurNavbar,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Text(
      'Index 0: Home',
      style: optionStyle,
    );
  }
}


class MyStatefulMusicPage extends StatefulWidget {
  const MyStatefulMusicPage({Key? key}) : super(key: key);

  @override
  State<MyStatefulMusicPage> createState() => _MyStatefulMusicPageState();
}

class _MyStatefulMusicPageState extends State<MyStatefulMusicPage> {
  //final songContainers = exampleContainerList;
  List<MediaModel> medias = exampleSongs;
  List<Widget> childrenList = [];
  final savedMedias = <MediaModel>{};

  Widget buildMediaCard(MediaModel media){
    final alreadySaved = savedMedias.contains(media);
    return Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Image.asset(media.imageUrl),
                  ListTile(
                    title: Text(media.title),
                    subtitle: Text(
                      media.genre,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                    trailing: Icon(
                      alreadySaved ? Icons.favorite : Icons.favorite_border,
                      color: alreadySaved ? Colors.red : null,
                      semanticLabel: alreadySaved ?'Remove from saved' : 'Save',
                    ),
                    onTap: () {      // NEW lines from here...
                      setState(() {
                        print(savedMedias.contains(media));
                        if (alreadySaved) {
                          savedMedias.remove(media);
                        } else { 
                          savedMedias.add(media); 
                        } 
                      });
                    },               // ... to here.
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      media.description,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              ),
            );
  }

  @override
  Widget build(BuildContext context){
      medias.forEach((media){
          childrenList.add(buildMediaCard(media));
      });
      //Création du widget créant la liste de chansons
      return ListView(
        //Separation des différentes chansons (Tiré de "Write your first Flutter app, part 1")
        padding: const EdgeInsets.all(16),
        children: childrenList,
      );
  }
}


class MyAboutPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Text(
      'Index 2: About',
      style: optionStyle,
    );
  }
}

class MyFavorites extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Text(
      'Index 3: Favorites',
      style: optionStyle,
    );
  }
}


