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
  MediaModel("../images/Albums/howdoesitfeel.jpg", "D'Angelo - Untitled (How Does It Feel)", "Neo soul, R&B",
  "'Untitled (How Does It Feel)' is a song by American singer, songwriter, and multi-instrumentalist D'Angelo.\n\n  It was released on January 1, 2000, by Virgin Records as a radio single in promotion of his second studio album Voodoo (2000). \n\n Written and produced by D'Angelo and Raphael Saadiq, the song was originally composed as a tribute to musician Prince. 'Untitled (How Does It Feel)' contains a vintage style and sound similar to that of Prince's early musical work. The song's lyrics concern a man's plea to his lover for sex."
  ,false),
  MediaModel("../images/Albums/getLucky.jpg", "Daft punk - Get Lucky", "Disco, House", 
  '"Get Lucky" is a song by French electronic music duo Daft Punk, featuring American singer Pharrell Williams and American guitarist Nile Rodgers. It was co-written by all of them.\n\n Daft Punk released the song as the lead single from their fourth and final studio album, Random Access Memories, on 19 April 2013.\n\n Before its release as a single, "Get Lucky" was featured in television advertisements broadcast during Saturday Night Live, after which Rodgers and Williams announced their involvement in the track.\n\n "Get Lucky" is a house-inspired disco, funk, and pop track with lyrics that, according to Williams, are about the good fortune of connecting with someone, as well as sexual chemistry.'
  , false),
  MediaModel("../images/Albums/dreamer.jpg", "Supertramp - Dreamer", "Progressive rock", 
  "'Dreamer' is a hit single from British band Supertramp's 1974 album 'Crime of the Century'. It peaked at number 13 on the UK singles chart in February 1975.\n\n'Dreamer' was composed by Roger Hodgson on his Wurlitzer piano at his mother's house when he was 19 years old.  \n\nAt that time he recorded a demo of the song using vocals, Wurlitzer, and banging cardboard boxes for percussion.\n\n Hodgson recalled, 'I was excited – it was the first time I laid hands on a Wurlitzer.'"
  , false
  ),

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
            Padding(
              padding: const EdgeInsets.all(16),
              child:
                Column(
                children: [
                  Image.asset(
                    "../images/record.png",
                    fit: BoxFit.cover, // Fixes border issues
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                        'Welcome on RecordKeeper !',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                  ),
                ]
              )
            )
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
            Padding(
              padding: const EdgeInsets.all(16),
              child:
                Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                        'Welcome on RecordKeeper !',
                      ),
                  ),
                  const Text(
                        'This application allows you to review my music collection and to choose your favorite songs',
                      ),
                  Padding(
                  padding: const EdgeInsets.all(16)),  
                  const Text(
                        'You can view the music collection by clicking on the music note of the navigation bar at the bottom. Then you can just scroll through the songs. By clicking on the image of the song you can access a short description of it.',
                      ),
                  Padding(
                  padding: const EdgeInsets.all(16)),  
                  const Text(
                        'Finally, you can add a song to your favorites by clicking on the heart next to the name. You can view your favorites by clicking on the heart icon of the navigation bar at the bottom.',
                      ),
                  Padding(
                    padding: const EdgeInsets.all(16)),  
                  const Text(
                        'This application was developped by Alex NICOLAS for the AMSE course at IMT Nord Europe',
                      ),
                      
                ]
              )
            )
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
