import 'package:flutter/material.dart';
//Attention j'ai changé la version du sdk necessaire dans le pubspec.yaml
final Color couleurNavbar = Colors.red;
class MediaModel {
  String imageUrl = "";
  String title  = "";
  String genre = "";
  String description  = "";
  bool isFavorite = false;
  //Constructor
  MediaModel(imgU, t, g, d, f){
    this.imageUrl = imgU;
    this.title = t;
    this.genre = g;
    this.description = d;
    this.isFavorite = f;
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
  MediaModel("../images/Albums/parliamentMothershipConnection.jpg", "Parliament - Give Up The Funk", "Funk", "Description 1", false),
  MediaModel("../images/Albums/funkadelicMaggotBrain.jpg", "Funkadelic - Maggot Brain", "Funk", "Description 2", false),
  MediaModel("../images/Albums/frankOceanChannelOrange.jpeg", "Frank Ocean - Super Rich Kids", "R&B, Soul", "Description 3", false),
];

void main() {
  runApp(const MyApp());
}




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
  List<MediaModel> medias = exampleSongs;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test1"),
      ),
      body: SingleChildScrollView(
        child:Column(
        children: [
          (_selectedIndex == 0) ? //Page d'acceuil
            Text("Home")                                              //To Do
            : Container(),
          (_selectedIndex == 1) ? //Page des musiques
            ListView.builder(
              //Separation des différentes chansons (Tiré de "Write your first Flutter app, part 1")
              padding: const EdgeInsets.all(16),
              itemCount: medias.length,
              shrinkWrap: true,
              itemBuilder: (context, i){
              return Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.asset(medias[i].imageUrl),
                        ListTile(
                          title: Text(medias[i].title),
                          subtitle: Text(
                            medias[i].genre,
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                          trailing: Icon(
                            medias[i].isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: medias[i].isFavorite ? Colors.red : null,
                            semanticLabel: medias[i].isFavorite ?'Remove from saved' : 'Save',
                          ),
                          onTap: () {     
                            setState(() {
                              medias[i].isFavorite = !medias[i].isFavorite;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            medias[i].description,
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                      ],
                    ),
                  );
              }
            )
            : Container(),
          (_selectedIndex == 2) ? //Page a propos
            Text("About")                                             //To Do
            : Container(),
          (_selectedIndex == 3) ? //Page liste des favoris
            ListView.builder(
              //Separation des différentes chansons (Tiré de "Write your first Flutter app, part 1")
              padding: const EdgeInsets.all(16),
              itemCount: medias.length,
              shrinkWrap: true,
              itemBuilder: (context, i){
              if(medias[i].isFavorite){
                return Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.asset(medias[i].imageUrl),
                        ListTile(
                          title: Text(medias[i].title),
                          subtitle: Text(
                            medias[i].genre,
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                          trailing: Icon(
                            medias[i].isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: medias[i].isFavorite ? Colors.red : null,
                            semanticLabel: medias[i].isFavorite ?'Remove from saved' : 'Save',
                          ),
                          onTap: () {     
                            setState(() {
                              medias[i].isFavorite = !medias[i].isFavorite;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            medias[i].description,
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                      ],
                    ),
                  );
              }
              else return Container();
              
              }
            )
            : Container(),
          ]
        ),
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
//INDEX
//ABOUT
//Lorsque la liste des medias se build, récuperer lse favoris du cart
//GESTION DES FAVORIS (Page favoris)
//AJOUTER ON TAP D'UN MEDIA AJOUTE LE MEDIA
//AJOUTER DES FILMS / SERIES
//DSECENDRE LE CART DANS LE TREE


/* Column(
              children:
                [
                for (var i = 0; i < medias.length; i += 1)
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.asset(medias[i].imageUrl),
                        ListTile(
                          title: Text(medias[i].title),
                          subtitle: Text(
                            medias[i].genre,
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                          trailing: Icon(
                            medias[i].isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: medias[i].isFavorite ? Colors.red : null,
                            semanticLabel: medias[i].isFavorite ?'Remove from saved' : 'Save',
                          ),
                          onTap: () {     
                            setState(() {
                              medias[i].isFavorite = !medias[i].isFavorite;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            medias[i].description,
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
            ) */





/* import 'package:flutter/material.dart';
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
                    onTap: () {     
                      setState(() {
                        if (alreadySaved) {
                          savedMedias.remove(media);
                        } else { 
                          savedMedias.add(media); 
                        } 
                      });
                    },
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
      //Création du widget créant la liste de chansons
      return ListView.builder(
        //Separation des différentes chansons (Tiré de "Write your first Flutter app, part 1")
        padding: const EdgeInsets.all(16),
        itemCount: medias.length,
        itemBuilder: (context, i) => buildMediaCard(medias[i]),
      );
  }
}

 */