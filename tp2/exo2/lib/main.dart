import 'package:flutter/material.dart';

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
  double valueSlider1 = 20;
  double valueSlider2 = 20;
  double valueSlider3 = 20;
  bool isChecked = false;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
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
                    ..rotateX(valueSlider1)
                    ..rotateY(valueSlider2)
                    ..scale(valueSlider3/100),
                  child: Image(image: NetworkImage('../images/parliamentMothershipConnection.jpg')),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
              ),
              Column(
                children: <Widget>[
                  Text("RotateX: "),
                  Slider(
                    value: valueSlider1,
                    max: 1000,
                    divisions: 1000,
                    label: valueSlider1.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        valueSlider1 = value;
                      });
                    },
                  ),
                  Text("RotateY: "),
                  Slider(
                    value: valueSlider2,
                    max: 1000,
                    divisions: 1000,
                    label: valueSlider2.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        valueSlider2 = value;
                      });
                    },
                  ),
                  Text("Scale: "),
                  Slider(
                    value: valueSlider3,
                    max: 1000,
                    divisions: 1000,
                    label: valueSlider3.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        valueSlider3 = value;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            valueSlider1 = 100;
          });
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.not_started_outlined),
      ),
    );
  }
}
