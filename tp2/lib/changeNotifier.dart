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
    int _nbRows = 3;
    int _nbCols = 3;
    int _indexRowTargeted = 0;
    int _indexColTargeted = 0;
    String _imgSrc = '../images/parliamentMothershipConnection.jpg'; 
    List<List<Tile>> _tiles = [
        [Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, -1), 1/3, true, false),Tile('../images/parliamentMothershipConnection.jpg', Alignment(0, -1), 1/3, false, true),Tile('../images/parliamentMothershipConnection.jpg', Alignment(1, -1), 1/3, false, false)],
        [Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, 0), 1/3, false, true),Tile('../images/parliamentMothershipConnection.jpg', Alignment(0, 0), 1/3, false, false),Tile('../images/parliamentMothershipConnection.jpg', Alignment(1, 0), 1/3, false, false)],
        [Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, 1), 1/3, false, false),Tile('../images/parliamentMothershipConnection.jpg', Alignment(0, 1), 1/3, false, false),Tile('../images/parliamentMothershipConnection.jpg', Alignment(1, 1), 1/3, false, false)],
];
   // List<List<Tile>> _tiles = [[]];
        
    // List<Tile> _tiles = [
    //     Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, -1), 1/3, false),
    //     Tile('../images/parliamentMothershipConnection.jpg', Alignment(0, -1), 1/3, false),
    //     Tile('../images/parliamentMothershipConnection.jpg', Alignment(1, -1), 1/3, false),
    //     Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, 0), 1/3, false),
    //     Tile('../images/parliamentMothershipConnection.jpg', Alignment(0, 0), 1/3, false),
    //     Tile('../images/parliamentMothershipConnection.jpg', Alignment(1, 0), 1/3, true),
    //     Tile('../images/parliamentMothershipConnection.jpg', Alignment(-1, 1), 1/3, false),
    //     Tile('../images/parliamentMothershipConnection.jpg', Alignment(0, 1), 1/3, false),
    //     Tile('../images/parliamentMothershipConnection.jpg', Alignment(1, 1), 1/3, false),
    // ];

    void resetTiles(String imgSrc, int nbRows, int nbCols) {  
        this.tiles = [[]];
        this.nbRows = nbRows;
        this.nbCols = nbCols;
        this.indexRowTargeted = 0;
        this.indexColTargeted = 0;
        this.imgSrc = imgSrc;
        
        this.updateTiles();
        //METTRE LES ADJACENTES
        //SET LES ALIGNEMENTS
        //SCRAMBLE
    }

    void updateTiles(){
        for (int r = 0; r < this.nbRows; r = r + 1) { 
            this.tiles.add([]);
            for (int c = 0; c < this.nbCols; c = c + 1) { 
                this.tiles[r].add(Tile(this.imgSrc, Alignment(-1 + (2*c)/(this.nbCols - 1), -1 + (2*r)/(this.nbRows - 1)), 1/this.nbCols, false, false));
            }  
        }
        updateTargetAndTargetable();
    }

    void updateTargetAndTargetable(){
        print("UPDATE");
        //RESET DES TARGETS
        for (int r = 0; r < this.nbRows; r = r + 1) { 
            for (int c = 0; c < this.nbCols; c = c + 1) { 
                this.tiles[r][c].isTarget = false;
                this.tiles[r][c].isTargetable = false;
            }  
        }

        //SET DES TARGETS
        this.tiles[this.indexRowTargeted][this.indexColTargeted].isTarget = true;

        if(this.indexRowTargeted == 0){
            //CASE COLLEE EN HAUT
            this.tiles[this.indexRowTargeted + 1][this.indexColTargeted].isTargetable = true;
        }
        else if(this.indexRowTargeted == this.nbRows - 1){
            //CASE COLLEE EN BAS
            this.tiles[this.indexRowTargeted - 1][this.indexColTargeted].isTargetable = true;
        }
        else{
            //CAS NORMAL
            this.tiles[this.indexRowTargeted + 1][this.indexColTargeted].isTargetable = true;
            this.tiles[this.indexRowTargeted - 1][this.indexColTargeted].isTargetable = true;
        }

        if(this.indexColTargeted == 0){
            //CASE COLLEE A GAUCHE
            this.tiles[this.indexRowTargeted][this.indexColTargeted + 1].isTargetable = true;
        }
        else if(this.indexColTargeted == this.nbCols - 1){
            //CASE COLLEE A DROITE
            this.tiles[this.indexRowTargeted][this.indexColTargeted - 1].isTargetable = true;
        }
        else{
            //CAS NORMAL
            this.tiles[this.indexRowTargeted][this.indexColTargeted + 1].isTargetable = true;
            this.tiles[this.indexRowTargeted][this.indexColTargeted - 1].isTargetable = true;
        }
    }

    void swapTiles(int rowIndexToSwapTo, int colIndexToSwapTo){
        Tile t1 = this.tiles[rowIndexToSwapTo][colIndexToSwapTo];
        Tile t2 = this.tiles[this.indexRowTargeted][this.indexColTargeted];

        this.tiles[rowIndexToSwapTo].removeAt(colIndexToSwapTo);
        this.tiles[rowIndexToSwapTo].insert(colIndexToSwapTo, t2);

        this.tiles[this.indexRowTargeted].removeAt(this.indexColTargeted);
        this.tiles[this.indexRowTargeted].insert(this.indexColTargeted, t1);

        this.indexRowTargeted = rowIndexToSwapTo;
        this.indexColTargeted = colIndexToSwapTo;

        this.updateTargetAndTargetable();
    }

    // List<Tile> get tiles => _tiles;

    // set tiles(List<Tile> newTiles){
    //    _tiles = newTiles; 
    //     notifyListeners();
    // }

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

    int get nbRows => _nbRows;
    set nbRows(int newValue){
        _nbRows = newValue;
        notifyListeners();
    }
    int get nbCols => _nbCols;
    set nbCols(int newValue){
        _nbCols = newValue;
        notifyListeners();
    }

    List<List<Tile>> get tiles => _tiles;

    set tiles(List<List<Tile>> newTiles){
        _tiles = newTiles; 
        notifyListeners();
    }

    int get indexRowTargeted => _indexRowTargeted;
    set indexRowTargeted(int newValue){
        _indexRowTargeted = newValue;
        notifyListeners();
    }
    int get indexColTargeted => _indexColTargeted;
    set indexColTargeted(int newValue){
        _indexColTargeted = newValue;
        notifyListeners();
    }

    String get imgSrc => _imgSrc;
    set imgSrc(String newValue){
        _imgSrc = newValue;
        notifyListeners();
    }
}