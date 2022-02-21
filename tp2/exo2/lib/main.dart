import 'package:flutter/material.dart';
import 'dart:async';
import 'package:exo2/changeNotifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double oldvalueSlider1 = 20;
  double oldvalueSlider2 = 20;
  double oldvalueSlider3 = 20;
  int _counter = 0;
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return ChangeNotifierProvider(
      create: (context) => animationButtonChange(),
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                ),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(color: Colors.white),
                  child:Transform(
                    alignment: Alignment.topRight,
                    transform: Matrix4.identity()
                      ..rotateX(oldvalueSlider1)
                      ..rotateY(oldvalueSlider2)
                      ..scale(oldvalueSlider3/100),
                    child: Image(image: NetworkImage('../images/parliamentMothershipConnection.jpg')),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                ),
                MyColumnOfSliders(),
              ],
            ),
        ),
        floatingActionButton: MyAnimateButton(),
      )
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
            max: 1000,
            divisions: 1000,
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
              setState(() {
                Timer.periodic(oneMiliSec, (Timer t){
                  if(provAnimation.valueSlider1 <900){
                    provAnimation.valueSlider1 = provAnimation.valueSlider1 + 10;
                  }
                  if(provAnimation.valueSlider2 <900){
                    provAnimation.valueSlider2 = provAnimation.valueSlider2 + 10;
                  }
                  if(provAnimation.valueSlider3 <900){
                    provAnimation.valueSlider3 = provAnimation.valueSlider3 + 10;
                  }
                  
                  //valueSlider3 += 10;
                  //print("Hi!");
                });
              });
            },
            backgroundColor: Colors.green,
            child: Icon(Icons.not_started_outlined),
          );
  }
}