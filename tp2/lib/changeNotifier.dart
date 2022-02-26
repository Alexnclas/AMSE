import 'package:flutter/foundation.dart';
import 'package:tp2/tile.dart';
import 'package:flutter/material.dart';

//Change notifier
class animationButtonChange extends ChangeNotifier {
    double _valueSlider1 = 2.0;
    double _valueSlider2 = 50.0;
    double _valueSlider3 = 7.0;

    double get valueSlider1 => _valueSlider1;
    double get valueSlider2 => _valueSlider2;
    double get valueSlider3 => _valueSlider3;

    bool _goOn = false;
    bool get goOn => _goOn;

    set valueSlider1(double newValue){
        _valueSlider1 = newValue;
        notifyListeners();
    }
    set valueSlider2(double newValue){
        _valueSlider2 = newValue;
        notifyListeners();
    }
    set valueSlider3(double newValue){
        _valueSlider3 = newValue;
        notifyListeners();
    }
     set goOn(bool newGoOn){
    _goOn = newGoOn;
    notifyListeners();
    }
}

class sliderDiviserChange extends ChangeNotifier{
    double _valueSlider = 2.0;
    double get valueSlider => _valueSlider;
    set valueSlider(double newValue){
        _valueSlider = newValue;
        notifyListeners();
    }
}




class tileChangeNotifier extends ChangeNotifier{
    double _valueSlider = 3.0;
    int _movableTileIndex = 5;
    List<Tile> _tiles = [
        Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, -1), 1/3),
        Tile('../images/parliamentMothershipConnection.jpg', Alignment(0, -1), 1/3),
        Tile('../images/parliamentMothershipConnection.jpg', Alignment(1, -1), 1/3),
        Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, 0), 1/3),
        Tile('../images/parliamentMothershipConnection.jpg', Alignment(0, 0), 1/3),
        Tile('../images/parliamentMothershipConnection.jpg', Alignment(1, 0), 1/3),
        Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, 1), 1/3),
        Tile('../images/parliamentMothershipConnection.jpg', Alignment(0, 1), 1/3),
        Tile('../images/parliamentMothershipConnection.jpg', Alignment(1, 1), 1/3),
    ];

    List<Tile> get tiles => _tiles;

    set tiles(List<Tile> newTiles){
       _tiles = newTiles; 
        notifyListeners();
    }

    double get valueSlider => _valueSlider;
    set valueSlider(double newValue){
        _valueSlider = newValue;
        notifyListeners();
    }
    
    int get movableTileIndex => _movableTileIndex;
    set movableTileIndex(int newValue){
        _movableTileIndex = newValue;
        notifyListeners();
    }
}