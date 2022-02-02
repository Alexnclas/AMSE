import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Inspired from https://github.com/flutter/samples/blob/master/provider_shopper
class MediaCatalog{
  static List<MediaModel> medias = [                                            //METTRE LES ImgsUrl
    MediaModel(0, 'Super Rich Kids', 'Frank Ocean', 'R&B, Soul', ''),
    MediaModel(1, 'Maggot Brain', 'Parliament', 'Funk', ''),
    MediaModel(2, 'Everybody Loves The Sunshine', 'Roy Ayers', 'Funk', ''),
  ];

  // In this simplified case, an item's position in the catalog
  // is also its id.
  
}


@immutable
class MediaModel{
    int id = 0;
    String name  = "";
    String author  = "";
    String description = "";
    String imageUrl = "";
    
    MediaModel(id, name, author, description, imageUrl){
      this.id = id;
      this.name = name;
      this.author = author;
      this.description = description;
      this.imageUrl = imageUrl;
    }

    // @override
    //     int get hashCode => id;

    @override
        bool operator ==(Object other) => other is MediaModel && other.id == id;
}


class Favorites extends ChangeNotifier {
  MediaCatalog catalog = MediaCatalog();

  //Liste des medias en favoris
  List<MediaModel> medias = [];

  void add(MediaModel media) {
    this.medias.add(media);
    notifyListeners();
  }

  void remove(MediaModel media) {
    this.medias.remove(media);
    notifyListeners();
  }
}