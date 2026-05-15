import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'menampilkan hello word',
      home: scaffold(
        appBar: AppBar(
          title: Text(Belajar Flutter),
        )
      ),
    );
  }
}
