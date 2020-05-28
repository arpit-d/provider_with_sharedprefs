import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => Data(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared preferences demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Shared preferences demo'),
    );
  }
}

class Data with ChangeNotifier {
  SharedPreferences prefs;
  int counter = 0;
  Data() {
    loadCounter();
  }

  incrementCounter(int value) {
    counter = (prefs.getInt('counter') ?? 0) + value;
    prefs.setInt('counter', counter);
    notifyListeners();
    //return counter;
  }

  decrementCount(int value){
    counter = (prefs.getInt('counter') ?? 0) - value;
    prefs.setInt('counter', counter);
    notifyListeners();
  }

  int get counters => counter;

  void loadCounter() async {
    prefs = await SharedPreferences.getInstance();

    counter = (prefs.getInt('counter') ?? 0);
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Incrementing counter after click

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            data.counters.toString(),
            style: Theme.of(context).textTheme.headline4,
          ),
          Test(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => data.incrementCounter(2),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  int v;
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context);
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            onChanged: (val) {
              setState(() {
                v = int.parse(val);
              });
            },
          ),
          RaisedButton(
            child: Text('Add'),
            onPressed: ()=> data.incrementCounter(v),
          ),
          RaisedButton(
            child: Text('Sub'),
            onPressed: ()=> data.decrementCount(v)
          )
        ],
      ),
    );
  }
}
