import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        snackBarTheme: const SnackBarThemeData(
           contentTextStyle: TextStyle(color: Colors.red),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _counterPlus = 0;
  int _counterMinus = 0;

  final snackBar = const SnackBar(
      content: Text("Меньше нуля нельзя!"),

  );

  void _incrementCounter() {
    setState(() {
      
      _counter++;
      _counterPlus++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {

        _counter--;
      }
        _counterMinus++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("$_counterPlus"),
              FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("$_counterMinus"),
              FloatingActionButton(

              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.horizontal_rule_rounded),
              ),
            ],
          ),
        ],

      ),

    );
  }
}
