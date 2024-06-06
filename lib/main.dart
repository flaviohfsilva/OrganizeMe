import 'package:flutter/material.dart';
import 'package:organizeme/pages/home/home.dart';
import 'package:organizeme/pages/library/library.dart';
import 'package:organizeme/pages/library/livro-selecionado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OrganizeMe',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Biblioteca(),
    );
  }
}
