import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool gsSelected = true;
  String input = '0';
  String answer = 'Answer';

  calc() {
    double inputted = double.tryParse(input) ?? 0;
    int gs = 45 + 15 + 20;
    int mens = 55 + 15 + 20;

    double result = 0;

    if (gsSelected) {
      result = ((inputted + 20) / 5.8) + gs;
    } else {
      result = ((inputted + 20) / 5.8) + mens;
    }

    answer = result.toStringAsFixed(2);
  }

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
        title: Center(child: Text(widget.title)),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.0,
            ),
            TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 20.0, height: 2.0),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input',
              ),
              onChanged: (value) {
                setState(() {
                  input = value;
                  calc();
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 100,
                  child: FlatButton(
                    color: gsSelected == true ? Colors.tealAccent : Colors.grey,
                    textColor: Colors.black,
                    onPressed: () {
                      setState(() {
                        gsSelected = true;
                        calc();
                      });
                    },
                    child: Text(
                      'GS',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 100,
                  child: FlatButton(
                    color:
                        gsSelected == false ? Colors.tealAccent : Colors.grey,
                    textColor: Colors.black,
                    onPressed: () {
                      setState(() {
                        gsSelected = false;
                        calc();
                      });
                    },
                    child: Text(
                      'MENS',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              enabled: false,
              style: TextStyle(fontSize: 20.0, height: 2.0),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: answer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
