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
  MediaModel("../images/Albums/parliamentMothershipConnection.jpg", "Parliament - Give Up The Funk", "Funk", 
  "Give Up the Funk (Tear the Roof off the Sucker) is a funk song by Parliament. It was released as a single under the name 'Tear the Roof off the Sucker (Give Up the Funk)'.\n\n It was the second single to be released from Parliament's 1975 album Mothership Connection (following 'P. Funk (Wants to Get Funked Up)').\n\n With its anthemic sing-along chorus, it is one of the most famous P-Funk songs. It also became Parliament's first certified million-selling single, going Gold in 1976.\n\n The bass vocal at the beginning of the song is performed by Ray Davis."
  , false),
  MediaModel("../images/Albums/funkadelicMaggotBrain.jpg", "Funkadelic - Maggot Brain", "Funk",
   "Maggot Brain is an instrumental by the American band Funkadelic, released on their 1971 album of the same name.\n\n The original recording, over ten minutes long, features little more than a spoken introduction and an extended guitar solo by Eddie Hazel. Music critic Greg Tate described it as Funkadelic's A Love Supreme; it is #60 on the Rolling Stone list of '100 Greatest Guitar Songs'.\n\nReportedly, 'Maggot Brain' was Hazel's nickname. Other sources say the title is a reference to band leader George Clinton finding his brother's 'decomposed dead body, skull cracked, in a Chicago apartment.'"
   , false),
  MediaModel("../images/Albums/frankOceanChannelOrange.jpeg", "Frank Ocean - Super Rich Kids", "R&B, Soul", 
  "'Super Rich Kids' is a song by American singer Frank Ocean, and the fifth single from his debut studio album, Channel Orange.\n\n  It was first performed live by Ocean in 2011 and then on his Channel Orange Tour in 2012. The single was released in March 2013.\n\n  The song is in the style of R&B and neo soul, and includes references to and samples of the songs 'Bennie and the Jets' by Elton John, 'Got to Give It Up' by Marvin Gaye, and 'Real Love' by Mary J. Blige.\n\n  It addresses young, wealthy characters' ennui and fears of the financial crisis with dry humor."
  , false),
  MediaModel("../images/Albums/howdoesitfeel.jpg", "D'angelo - Untitled (How Does It Feel)", "Neo soul, R&B",
  "'Untitled (How Does It Feel)' is a song by American singer, songwriter, and multi-instrumentalist D'Angelo.\n\n  It was released on January 1, 2000, by Virgin Records as a radio single in promotion of his second studio album Voodoo (2000). \n\n Written and produced by D'Angelo and Raphael Saadiq, the song was originally composed as a tribute to musician Prince. 'Untitled (How Does It Feel)' contains a vintage style and sound similar to that of Prince's early musical work. The song's lyrics concern a man's plea to his lover for sex."
  ,false)
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
        scaffoldBackgroundColor: Colors.grey[300],
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
        title: Text("Record keeper"),
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
                        GestureDetector(
                          onTap: () {                       //ZOOM sur une carte
                            Navigator.push(   
                                      context,
                                      MaterialPageRoute(
                                          builder: (context){
                                            return Scaffold(
                                              appBar: AppBar(
                                                title: Text(medias[i].title),
                                              ),
                                              body: Center(
                                                child:
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child:Column(
                                                            children:[
                                                              Image.asset(
                                                                  medias[i].imageUrl,
                                                                  fit: BoxFit.cover, // Fixes border issues
                                                                ),
                                                              Padding(
                                                                padding: EdgeInsets.all(16.0),
                                                                child:Text(medias[i].genre)
                                                                ),
                                                              Text(medias[i].description)
                                                            ],
                                                          ),
                                                      ),
                                                )
                                                
                                            );
                                          }
                                          ));
                          }, 
                          child: Image.asset(medias[i].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
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
                        /* Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            medias[i].description,
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),*/
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