import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: null,
          child: const Icon(Icons.menu, color: Colors.white)
        ),
        title: const Text('Le Duel 2022', style: TextStyle(fontSize: 25.0)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: null,
              child: const Icon(Icons.person, color: Colors.white)
            )
          )
        ],
        automaticallyImplyLeading: true,
      ),
      backgroundColor: Colors.red,
      body: SizedBox(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: SizedBox(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: const <Widget>[
                        Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 2.0, right: 2.0),
                            child: Text(
                              'Qui sera notre futur.e président.e pour les 5 prochaines années ?',
                              style: TextStyle(fontFamily: 'Coolvetica', fontSize: 18.0),
                              textAlign: TextAlign.center,
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 2.0, left: 2.0, right: 2.0),
                            child: Text(
                              'Cliquez sur le bouton de votre candidat et saisissez le nombre de points que vous souhaitez lui attribuer (1 point = 1 euro)',
                              style: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
                              textAlign: TextAlign.center,
                            )
                        ),
                      ],
                    )
                  )
                )
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/emmanuel_macron.jpg"),
                    fit: BoxFit.cover
                  )
                ),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: null
                      )
                    ),
                    Flexible(
                      flex: 7,
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 5,
                            child: Container(
                              child: null
                            )
                          ),
                          Flexible(
                            flex: 5,
                            child: Column(
                              children: <Widget>[
                                Flexible(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                                    child: Container(
                                      child: Column(
                                        children: const <Widget>[
                                          Text('Emmanuel Macron', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 15.0, color: Colors.black)),
                                          Text('10% (10 euros)', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14.0, color: Colors.black))
                                        ]
                                      ),
                                      alignment: Alignment.topRight
                                    )
                                  )
                                ),
                                Flexible(
                                  flex: 4,
                                  child: Container(
                                    child: null
                                  )
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
                                      child: TextButton(
                                        style: TextButton.styleFrom(backgroundColor: Colors.greenAccent),
                                        onPressed: null,
                                        child: const Text('Voter', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 15.0, color: Colors.black))
                                      )
                                    )
                                  )
                                )
                              ]
                            )
                          )
                        ]
                      )
                    )
                  ]
                )
              )
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 10,
                      child: Container(
                          color: Colors.greenAccent
                      )
                  ),
                  Expanded(
                      flex: 100,
                      child: Container(
                          color: Colors.pinkAccent
                      )
                  )
                ]
              )
            ),
            Expanded(
                flex: 4,
                child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/marine_le_pen.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Row(
                        children: <Widget>[
                          Flexible(
                              flex: 3,
                              child: Container(
                                  color: Colors.black.withOpacity(0.5),
                                  child: null
                              )
                          ),
                          Flexible(
                              flex: 7,
                              child: Row(
                                  children: <Widget>[
                                    Flexible(
                                        flex: 5,
                                        child: Container(
                                            child: null
                                        )
                                    ),
                                    Flexible(
                                        flex: 5,
                                        child: Column(
                                            children: <Widget>[
                                              Flexible(
                                                  flex: 2,
                                                  child: Padding(
                                                      padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                                                      child: Container(
                                                          child: Column(
                                                              children: const <Widget>[
                                                                Text('Marine Le Pen', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 15.0, color: Colors.white)),
                                                                Text('90% (90 euros)', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14.0, color: Colors.white))
                                                              ]
                                                          ),
                                                          alignment: Alignment.topRight
                                                      )
                                                  )
                                              ),
                                              Flexible(
                                                  flex: 4,
                                                  child: Container(
                                                      child: null
                                                  )
                                              ),
                                              Flexible(
                                                  flex: 2,
                                                  child: Container(
                                                      alignment: Alignment.bottomRight,
                                                      child: Padding(
                                                          padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
                                                          child: TextButton(
                                                              style: TextButton.styleFrom(backgroundColor: Colors.pinkAccent),
                                                              onPressed: null,
                                                              child: const Text('Voter', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 15.0, color: Colors.black))
                                                          )
                                                      )
                                                  )
                                              )
                                            ]
                                        )
                                    )
                                  ]
                              )
                          )
                        ]
                    )
                )
            ),
          ]
        )
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              IconButton(
                icon: Icon(
                  Icons.language,
                  color: Colors.white
                ),
                onPressed: null
              ),
              IconButton(
                  icon: Icon(
                      Icons.forum,
                      color: Colors.white
                  ),
                  onPressed: null
              )
            ],
          )
        ),
        shape: const CircularNotchedRectangle(),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.redAccent,
          child: Icon(Icons.thumb_up, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }
}