import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => Counter(),
          child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Sample',
      home: CounterApp(),
    );
  }
}


class Counter with ChangeNotifier {
  int _number = 0;

  int get number => _number;

  int increment(){
    _number++;
    notifyListeners();
  }
}

class CounterApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Code"),
      ),
      body: Center(
        child: Text("Press Your Bottom ${context.watch<Counter>().number} time"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> context.read<Counter>().increment(),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
    );
  }
}


