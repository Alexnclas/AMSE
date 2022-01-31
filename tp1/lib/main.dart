import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Style des pages
const TextStyle optionStyle =  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  
//Objets a recenser (Classes)
class MediaModel {
  String imageUrl = "";
  String title  = "";
  String description  = "";
  //Constructor
  MediaModel(imgU, t, d){
    this.imageUrl = imgU;
    this.title = t;
    this.description = d;
    }
}
//Objets a recenser (Examples)
final exampleSongs = [
  MediaModel(
    "ImageUrl 1", "Titre 1", "Description 1",
  ),
  MediaModel(
    "ImageUrl 2",
    "Titre 2",
    "Description 2",
  ),
  MediaModel(
    "ImageUrl 3",
    "Titre 3",
    "Description 3",
  ),
  MediaModel(
    "ImageUrl 4",
    "Titre 4",
    "Description 4",
  ),
  MediaModel(
    "ImageUrl 4",
    "Titre 4",
    "Description 4",
  ),
  MediaModel(
    "ImageUrl 5",
    "Titre 5",
    "Description 5",
  ),
  MediaModel(
    "ImageUrl 6",
    "Titre 6",
    "Description 6",
  ),
  MediaModel(
    "ImageUrl 6",
    "Titre 6",
    "Description 6",
  ),
  MediaModel(
    "ImageUrl 7",
    "Titre 7",
    "Description 7",
  ),
  MediaModel(
    "ImageUrl 8",
    "Titre 8",
    "Description 8",
  ),
  MediaModel(
    "ImageUrl 9",
    "Titre 9",
    "Description 9",
  ),
  MediaModel(
    "ImageUrl 10",
    "Titre 10",
    "Description 10",
  ),
  MediaModel(
    "ImageUrl 11",
    "Titre 11",
    "Description 11",
  ),
  MediaModel(
    "ImageUrl 12",
    "Titre 12",
    "Description 12",
  ),
  MediaModel(
    "ImageUrl 13",
    "Titre 13",
    "Description 13",
  ),
  MediaModel(
    "ImageUrl 14",
    "Titre 14",
    "Description 14",
  ),
  MediaModel(
    "ImageUrl 15",
    "Titre 15",
    "Description 15",
  ),
  MediaModel(
    "ImageUrl 16",
    "Titre 16",
    "Description 16",
  ),
  MediaModel(
    "ImageUrl 17",
    "Titre 17",
    "Description 17",
  ),
  MediaModel(
    "ImageUrl 18",
    "Titre 18",
    "Description 18",
  ),
  MediaModel(
    "ImageUrl 19",
    "Titre 19",
    "Description 19",
  ),
  MediaModel(
    "ImageUrl 20",
    "Titre 20",
    "Description 20",
  ),
];

List<Widget> createMediaContainerList(List<MediaModel> medias){
  List<Widget> returnList = [];
  medias.forEach((media){
      return returnList.add(Container(
        height: 50,
        color: Colors.amber[600],
        child: Center(child: Text(media.title)),
      )
    );
  });
  return returnList;
}

final exampleContainerList = createMediaContainerList(exampleSongs);

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
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack),
            label: 'Music',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
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
  final _songsToDisplay = exampleContainerList;
  
  Widget buildSongList(){
    //Création du widget créant la liste de chansons
    return ListView(
      //Separation des différentes chansons (Tiré de "Write your first Flutter app, part 1")
      padding: const EdgeInsets.all(16),
      children: _songsToDisplay,
    );
  }


  @override
  Widget build(BuildContext context){
    return buildSongList();
    // return Text(
    //   _songsToDisplay[0].title,
    //   style: optionStyle, 
    // );
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


