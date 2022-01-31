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
  MediaModel("../images/Albums/parliamentMothershipConnection.jpg", "Parliament - Give Up The Funk", "Funk"),
  MediaModel("../images/Albums/funkadelicMaggotBrain.jpg", "Funkadelic - Maggot Brain", "Funk"),
  MediaModel("../images/Albums/frankOceanChannelOrange.jpeg", "Frank Ocean - Super Rich Kids", "R&B, Soul"),
];

List<Widget> createMediaContainerList(List<MediaModel> medias){
  List<Widget> returnList = [];
  medias.forEach((media){
    returnList.add(Image(
      image: NetworkImage(media.imageUrl),
    ));
    returnList.add(Container(
      height: 75,
      child: Center(child: Text(media.title)),
    )
    );
    returnList.add(const Divider());
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
  final songContainers = exampleContainerList;
  
  Widget buildSongList(){
    //Création du widget créant la liste de chansons
    return ListView(
      //Separation des différentes chansons (Tiré de "Write your first Flutter app, part 1")
      padding: const EdgeInsets.all(16),
      children: songContainers,
    );
  }


  @override
  Widget build(BuildContext context){
    return buildSongList();
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


