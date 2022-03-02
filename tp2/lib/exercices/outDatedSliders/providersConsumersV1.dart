import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tp2/changeNotifier.dart';
import 'package:tp2/tile.dart';
import 'package:provider/provider.dart';
import 'package:tp2/tile.dart';

class MyChangingImage extends StatefulWidget{
  @override
  createState() => _MyChangingImageState();
}

class _MyChangingImageState extends State<MyChangingImage>{
  @override
  Widget build(BuildContext context){
    return Consumer<animationButtonChange>(
      builder: (context, provAnimation, _) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(color: Colors.white),
        child:Transform(
          alignment: Alignment.topRight,
          transform: Matrix4.identity()
            ..rotateX(3.1415 / (provAnimation.valueSlider1/100))
            ..rotateY(3.1415 / (provAnimation.valueSlider2/100))
            ..scale(provAnimation.valueSlider3/250),
          child: Image(image: NetworkImage('../images/parliamentMothershipConnection.jpg')),
        ),
      ),
    );
  }
}

class MyColumnOfSliders extends StatefulWidget{
  @override
  createState() => _MyColumnOfSlidersState();
}
class _MyColumnOfSlidersState extends State<MyColumnOfSliders>{
  @override
  Widget build(BuildContext context){
    return Consumer<animationButtonChange>(
      builder: (context, provAnimation, _) => Column(
        children: <Widget>[
          Text("RotateX: "),
          Slider(
            value: provAnimation.valueSlider1,
            max: 1000,
            divisions: 1000,
            label: provAnimation.valueSlider1.round().toString(),
            onChanged: (double value) {
              setState(() {
                provAnimation.valueSlider1 = value;
              });
            },
          ),
          Text("RotateY: "),
          Slider(
            value: provAnimation.valueSlider2,
            max: 1000,
            divisions: 1000,
            label: provAnimation.valueSlider2.round().toString(),
            onChanged: (double value) {
              setState(() {
                provAnimation.valueSlider2 = value;
              });
            },
          ),
          Text("Scale: "),
          Slider(
            value: provAnimation.valueSlider3,
            min: 1,
            max: 1000,
            divisions: 1002,
            label: provAnimation.valueSlider3.round().toString(),
            onChanged: (double value) {
              setState(() {
                provAnimation.valueSlider3 = value;
              });
            },
          ),
        ],
      ),
    );
    
  }
}


class MyAnimateButton extends StatefulWidget{
  @override
  createState() => _MyAnimateButtonState();
}


class _MyAnimateButtonState extends State<MyAnimateButton>{
  @override
  Widget build(BuildContext context){
    final provAnimation = Provider.of<animationButtonChange>(context);
    Duration oneMiliSec = Duration(milliseconds: 50);
    return FloatingActionButton(
            onPressed: () {
              if(provAnimation.goOn){
                provAnimation.goOn = false;
              }
              else{
                provAnimation.goOn = true;
              }
              setState(() {
                Timer.periodic(oneMiliSec, (Timer t){
                  if(provAnimation.goOn){
                    if(provAnimation.valueSlider1 > 990){
                    provAnimation.valueSlider1 = 0;
                    }
                    else{
                      provAnimation.valueSlider1 = provAnimation.valueSlider1 + 10;
                    }
                    if(provAnimation.valueSlider2 < 9){
                      provAnimation.valueSlider2 = 1000;
                    }
                    else{
                      provAnimation.valueSlider2 = provAnimation.valueSlider2 - 9;
                    }
                    if(provAnimation.valueSlider3 > 990){
                      provAnimation.valueSlider3 = 250;
                    }
                    else{
                      provAnimation.valueSlider3 = provAnimation.valueSlider3 + 7;
                    }
                  }
                  else{
                    t.cancel();
                  }
                }
                );
              });
            },
            backgroundColor: Colors.green,
            child: Icon(Icons.not_started_outlined),
          );
  }
}