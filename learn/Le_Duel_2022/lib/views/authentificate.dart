import 'dart:ui';

import 'package:flutter/material.dart';

class Authentificate extends StatelessWidget {
  const Authentificate({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (dragEndDetails) {
          if(dragEndDetails.primaryVelocity! > 0) {
            Navigator.pop(context);
          }
        },
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                      children: <Widget>[
                        const Icon(Icons.people),
                        const Text('Connexion', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 20.0)),
                        const Text('Vous possédez déjà un compte ? Connectez-vous !', style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic)),
                        const Padding(
                            padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                            child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  hintText: 'Nom d\'utilisateur'
                                )
                            )
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.key),
                                hintText: 'Mot de passe'
                              ),
                              enableSuggestions: false,
                              autocorrect: false,
                              obscureText: true,
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: TextButton(
                            style: TextButton.styleFrom(backgroundColor: Colors.blue),
                            onPressed: null,
                            child: const Text('Connexion', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 20.0, color: Colors.white))
                          )
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: GestureDetector(
                              onTap: () {
                                print('test');
                              },
                              child: TextButton(
                                  style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
                                  onPressed: null,
                                  child: const Text('Pas encore inscrit ?', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 20.0, color: Colors.white))
                              )
                            )
                        )
                      ]
                  )
                )
              )
            )
          ]
        )
      ),
    );
  }
}