import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Show Snackbar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                  color: Colors.red,
                  child: Text('Snackbar that throws error'),
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('It throws error'),
                          duration: Duration(seconds: 3),
                        ));
                  }),
              Builder(
                builder: (context) => RaisedButton(
                    color: Colors.green,
                    child: Text('Show Snackbar using context from Builder'),
                    onPressed: () {
                      Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Context from Builder'),
                            duration: Duration(seconds: 3),
                          ));
                    }),
              ),
              SeparateWidget(),
              RaisedButton(
                  color: Colors.yellow,
                  child: Text('Show Snackbar using a GlobalKey'),
                  onPressed: () {
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text('Assign a GlobalKey to the Scaffold'),
                      duration: Duration(seconds: 3),
                    ));
                  }),
            ],
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SeparateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.blueAccent,
        child: Text("Button moved to separate widget"),
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Button moved to separate widget'),
                duration: Duration(seconds: 3),
              ));
        });
  }
}
