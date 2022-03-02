import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tp2/changeNotifier.dart';
import 'package:tp2/tile.dart';
import 'package:provider/provider.dart';
import 'package:tp2/exercices/outDatedSliders/providersConsumersV1.dart';

class MyDividingSlider extends StatefulWidget{
  @override
  createState() => _MyDividingSliderState();
}


class _MyDividingSliderState extends State<MyDividingSlider>{
  @override
  Widget build(BuildContext context){
    final provDiv = Provider.of<sliderDiviserChange>(context);
    return  Slider(
            value: provDiv.valueSlider,
            min:2,
            max: 10,
            divisions: 10,
            label: provDiv.valueSlider.round().toString(),
            onChanged: (double value) {
              setState(() {
                provDiv.valueSlider = value;
              });
            },
          );
  }
}


class MyDivisibleImage extends StatefulWidget{
  @override
  createState() => _MyDivisibleImageState();
}

class _MyDivisibleImageState extends State<MyDivisibleImage>{
  @override
  Widget build(BuildContext context){
    return Consumer<sliderDiviserChange>(
      builder: (context, provDiv, _) => Flexible(
        child: GridView.count(
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: provDiv.valueSlider.round(),
          children:[
            for (var j = 0; j < provDiv.valueSlider.round(); j++)
              for (var i = 0; i < provDiv.valueSlider.round(); i++)
                FittedBox(
                  fit: BoxFit.fill,
                  child: ClipRect(
                    child: Container(
                      child: Align(
                        alignment: Alignment(-1 + (2*i)/(provDiv.valueSlider.round() - 1), -1 + (2*j)/(provDiv.valueSlider.round() - 1)),        //COMMENT TROUVER ALIGNEMENT
                        widthFactor: 1/provDiv.valueSlider.round(),
                        heightFactor: 1/provDiv.valueSlider.round(),
                        child: Image.network('../images/parliamentMothershipConnection.jpg'),
                      ),
                    ),
                  ),
                )
          ],
        ),
      )
    );
  }
}