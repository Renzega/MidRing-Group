import 'package:flutter/material.dart';

class Authentificate extends StatelessWidget {
  const Authentificate({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connexion')),
      body: GestureDetector(
        onHorizontalDragEnd: (dragEndDetails) {
          if(dragEndDetails.primaryVelocity! < 0) {
            print('mouvement 1');
          } else if(dragEndDetails.primaryVelocity! > 0) {
            print('mouvement 2');
          }
        },
      )
    );
  }
}