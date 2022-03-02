import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:math' as math;

math.Random random = new math.Random();

class Tile {
  Color color = Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  String imgSrc;
  Alignment alignment;
  double size;
  bool isTarget = false;  //CASE ACTUELLEMENT SELECTIONNEE
  bool isTargetable = false; //CASE QUE L'ON PEUT SELECTIONNEE
  Tile(this.imgSrc, this.alignment, this.size, this.isTarget, this.isTargetable);
  
}

// class GameBoard{
//   final List<Tile> tiles;
//   GameBoard(this.tiles);

// }


class TileWidget extends StatelessWidget {
  final Tile tile;

  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    if(tile.isTarget){
      return Padding(
        padding: EdgeInsets.all(5.0),
        child: FittedBox(
          fit: BoxFit.fill,
          child: ClipRect(
            child: Container(
              child: Align(
                alignment: this.tile.alignment,        
                widthFactor: this.tile.size,
                heightFactor: this.tile.size,
                child: Image.network(this.tile.imgSrc),
              ),
            ),
          ),
        ),
      );
    }
    else if(tile.isTargetable){
      return Padding(
        padding: EdgeInsets.all(2.5),
        child: FittedBox(
          fit: BoxFit.fill,
          child: ClipRect(
            child: Container(
              child: Align(
                alignment: this.tile.alignment,        
                widthFactor: this.tile.size,
                heightFactor: this.tile.size,
                child: Image.network(this.tile.imgSrc),
              ),
            ),
          ),
        ),
      );
    }

    else{
      return FittedBox(
          fit: BoxFit.fill,
          child: ClipRect(
            child: Container(
              child: Align(
                alignment: this.tile.alignment,        
                widthFactor: this.tile.size,
                heightFactor: this.tile.size,
                child: Image.network(this.tile.imgSrc),
              ),
            ),
          ),
        );
    }
  }
}