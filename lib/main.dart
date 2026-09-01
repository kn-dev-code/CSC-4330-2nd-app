import 'package:flutter/material.dart';
import './pages/kyle/aboutme.dart';

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
        // 1. FIXED: Added 'ColorScheme' before '.fromSeed'
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), 
      ), 
      home: const MyHomePage(title: 'Kyle & Gabriel About Me App'), 
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

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, 
        title: Text(widget.title), 
      ), 
      // 2. FIXED: Combined the isolated button and Column into a proper Center layout
      body: Center( 
        child: Column( 
          // 3. FIXED: Added 'MainAxisAlignment' before '.center'
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [ 
            const Text('You have pushed the button this many times:'), 
            Text( 
              '$_counter', 
              style: Theme.of(context).textTheme.headlineMedium, 
            ), 
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () { 
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const AboutMePage()),
                ); 
              },
              child: const Text('Kyle About Me Page'), 
            ), 
          ], 
        ), 
      ), 
      floatingActionButton: FloatingActionButton( 
        onPressed: _incrementCounter, 
        tooltip: 'Increment', 
        child: const Icon(Icons.add), 
      ), 
    ); 
  } 
}
