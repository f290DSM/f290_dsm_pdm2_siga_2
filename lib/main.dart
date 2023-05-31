import 'package:flutter/material.dart';
import 'assets/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: mColorGrena).copyWith(
          primary: mColorGrena,
          secondary: mColorGrey,
        ),
      ),
      home: const MyHomePage(title: 'SIGA 2.0'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int c = 0;
  var _slider = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'LabelText',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)))),
            ),
          ),
          FilledButton(onPressed: () {}, child: const Text('FilledButton')),
          const Card(
            elevation: 5,
            child: SizedBox(
              height: 100,
              width: 300,
            ),
          ),
          OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
          Slider(
            min: 1,
            max: 10,
            divisions: 10,
            value: _slider,
            onChanged: (value) => setState(() => _slider = value),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              10,
              (index) => Container(
                height: 30,
                width: 30,
                color: mColorGrena.withAlpha(c += 25),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
