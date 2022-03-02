import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tp2/changeNotifier.dart';
import 'package:tp2/tile.dart';
import 'package:provider/provider.dart';
import 'package:tp2/exercices/outDatedSliders/providersConsumersV1.dart';
import 'package:tp2/exercices/outDatedSliders/providersConsumersV2.dart';

class MyDivisibleImageV2 extends StatefulWidget{
  @override
  createState() => _MyDivisibleImageV2State();
}

class _MyDivisibleImageV2State extends State<MyDivisibleImageV2>{
  String imgSrc = '../images/parliamentMothershipConnection.jpg';



  @override
  Widget build(BuildContext context){
    return Consumer<tileChangeNotifier>(
      builder: (context, provTile, _) => Flexible(
        child: GridView.count(
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: provTile.valueSlider.round(), //Slider VALUE
          children: [
              //DEPLACEMENT DES TILES
             for (int r = 0; r < provTile.nbRows; r += 1)
                for (int c = 0; c < provTile.nbCols; c += 1)   //ON CONSIDERE QUE TILES A LE MEME NOMBRE DE LIGNES ET DE COLONNES
                  GestureDetector(
                    onTap: (){
                      setState((){
                        provTile.swapTiles(r, c);
                      });
                    },
                    child: TileWidget(provTile.tiles[r][c]),
                    )
          ],
        ),
      )
    );
  }
}

class MyDividingSliderV2 extends StatefulWidget{
  @override
  createState() => _MyDividingSliderV2State();
}


class _MyDividingSliderV2State extends State<MyDividingSliderV2>{
  String imgSrc = '../images/parliamentMothershipConnection.jpg';
  @override
  Widget build(BuildContext context){
    final provTile = Provider.of<tileChangeNotifier>(context);
    return  Slider(
            value: provTile.valueSlider,
            min:2,
            max: 10,
            divisions: 10,
            label: provTile.valueSlider.round().toString(),
            onChanged: (double value) {
              setState(() {
                provTile.valueSlider = value;
                provTile.resetTiles(imgSrc, provTile.valueSlider.round(), provTile.valueSlider.round());
              });
            },
          );
  }
}
