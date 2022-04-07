import 'package:flutter/material.dart';
import 'code.dart';
import 'future.dart';

void main() {
  OrdinateurFnac ordiFnac = OrdinateurFnac('Dell', 'AlienWare', 'RTX 3090', 'Intel Core i7', '32GB', 2000);
  OrdinateurDarty ordiDarty = OrdinateurDarty(6, 'HP Omen', 'GTX 1060', 'Intel Core i7', '16GB', 1490);
  Acheteur<OrdinateurFnac> acheteur1 = Acheteur('Samuel', 'Clauzon', 123, ordiFnac);
  print(acheteur1.getOrdinateur());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to My App')
        ),
        body: const Center(
          child: Text('Content')
        )
      )
    );
  }
}