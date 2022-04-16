import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'menu.dart';
import 'authentificate.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(_showMenuPage());
              },
              icon: const Icon(Icons.menu, color: Colors.white)
          ),
          title: const Text('Le Duel 2022', style: TextStyle(fontSize: 25.0)),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.all(0.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(_showLoginPage());
                    },
                    icon: const Icon(Icons.person, color: Colors.white)
                )
            )
          ],
          automaticallyImplyLeading: true,
        ),
        backgroundColor: Colors.white,
        body: BottomMenu(page: currentPage),
        bottomNavigationBar: BottomAppBar(
          color: Colors.red,
          child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                      icon: const Icon(
                          Icons.language,
                          color: Colors.white
                      ),
                      onPressed: setPageToPrograms
                  ),
                  IconButton(
                      icon: const Icon(
                          Icons.forum,
                          color: Colors.white
                      ),
                      onPressed: setPageToBlog
                  )
                ],
              )
          ),
          shape: const CircularNotchedRectangle(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: setPageToVote,
          backgroundColor: Colors.redAccent,
          child: const Icon(Icons.thumb_up, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }

  Route _showMenuPage() {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation <double> animation, Animation <double> secondaryAnimation) {
          return const Menu();
        },
        transitionsBuilder: (BuildContext context, Animation <double> animation, Animation <double> secondaryAnimation, Widget child) {
          return SlideTransition(
              position: Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                  end: Offset.zero
              ).animate(animation),
              child: SlideTransition(
                position: Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(-1.0, 0.0)
                ).animate(secondaryAnimation),
                child: child,
              )
          );
        }
    );
  }

  Route _showLoginPage() {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation <double> animation, Animation <double> secondaryAnimation) {
          return const Authentificate();
        },
        transitionsBuilder: (BuildContext context, Animation <double> animation, Animation <double> secondaryAnimation, Widget child) {
          return SlideTransition(
              position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero
              ).animate(animation),
              child: SlideTransition(
                position: Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(-1.0, 0.0)
                ).animate(secondaryAnimation),
                child: child,
              )
          );
        }
    );
  }

  void setPageToPrograms() {
    setState(() {
      currentPage = 1;
    });
  }

  void setPageToVote() {
    setState(() {
      currentPage = 2;
    });
  }

  void setPageToBlog() {
    setState(() {
      currentPage = 3;
    });
  }

}


class BottomMenu extends StatefulWidget {
  const BottomMenu({Key? key, required this.page}) : super(key: key);

  final int page;

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    if(widget.page == 1) {
      return Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: const Text('Programmes des candidats.es', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 20.0))
            )
          ),
          const Flexible(
            flex: 9,
            child: ProgrammeCandidat()
          )
        ]
      );
    } else if(widget.page == 2) {
      return SizedBox(
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
                                      'Cliquez sur le bouton "Voter" de votre candidat puis saisissez le nombre de points que vous souhaitez lui attribuer (1 point = 1 euro)',
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
                                      child: Column(
                                          children: <Widget>[
                                            Flexible(
                                                flex: 2,
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    child: const Text('Top Votants', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white))
                                                )
                                            ),
                                            Flexible(
                                                flex: 8,
                                                child: Column(
                                                    children: <Widget>[
                                                      Row(
                                                          children: <Widget>[
                                                            Flexible(
                                                                flex: 2,
                                                                child: Container(
                                                                    alignment: Alignment.center,
                                                                    margin: const EdgeInsets.only(left: 5.0),
                                                                    color: Colors.amberAccent,
                                                                    child: const Text('1', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black))
                                                                )
                                                            ),
                                                            Flexible(
                                                                flex: 8,
                                                                child: Container(
                                                                    padding: const EdgeInsets.only(left: 5.0),
                                                                    child: Column(
                                                                        children: const <Widget>[
                                                                          Text('LordRenzega', style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white)),
                                                                          Text('600.00€', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic, color: Colors.white))
                                                                        ]
                                                                    )
                                                                )
                                                            )
                                                          ]
                                                      ),
                                                      Row(
                                                          children: <Widget>[
                                                            Flexible(
                                                                flex: 2,
                                                                child: Container(
                                                                    alignment: Alignment.center,
                                                                    margin: const EdgeInsets.only(top: 10.0, left: 5.0),
                                                                    color: Colors.amber,
                                                                    child: const Text('2', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black))
                                                                )
                                                            ),
                                                            Flexible(
                                                                flex: 8,
                                                                child: Container(
                                                                    padding: const EdgeInsets.only(top: 10.0, left: 5.0),
                                                                    child: Column(
                                                                        children: const <Widget>[
                                                                          Text('JohnDoe', style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white)),
                                                                          Text('514.00€', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic, color: Colors.white))
                                                                        ]
                                                                    )
                                                                )
                                                            )
                                                          ]
                                                      ),
                                                      Row(
                                                          children: <Widget>[
                                                            Flexible(
                                                                flex: 2,
                                                                child: Container(
                                                                    alignment: Alignment.center,
                                                                    margin: const EdgeInsets.only(top: 10.0, left: 5.0),
                                                                    color: Colors.orange,
                                                                    child: const Text('3', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black))
                                                                )
                                                            ),
                                                            Flexible(
                                                                flex: 8,
                                                                child: Container(
                                                                    padding: const EdgeInsets.only(top: 10.0, left: 5.0),
                                                                    child: Column(
                                                                        children: const <Widget>[
                                                                          Text('Inconnu', style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white)),
                                                                          Text('216.47€', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic, color: Colors.white))
                                                                        ]
                                                                    )
                                                                )
                                                            )
                                                          ]
                                                      )
                                                    ]
                                                )
                                            )
                                          ]
                                      )
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
                                      child: Column(
                                          children: <Widget>[
                                            Flexible(
                                                flex: 2,
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    child: const Text('Top Votants', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white))
                                                )
                                            ),
                                            Flexible(
                                                flex: 8,
                                                child: Column(
                                                    children: <Widget>[
                                                      Row(
                                                          children: <Widget>[
                                                            Flexible(
                                                                flex: 2,
                                                                child: Container(
                                                                    alignment: Alignment.center,
                                                                    margin: const EdgeInsets.only(left: 5.0),
                                                                    color: Colors.amberAccent,
                                                                    child: const Text('1', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black))
                                                                )
                                                            ),
                                                            Flexible(
                                                                flex: 8,
                                                                child: Container(
                                                                    padding: const EdgeInsets.only(left: 5.0),
                                                                    child: Column(
                                                                        children: const <Widget>[
                                                                          Text('LordRenzega', style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white)),
                                                                          Text('600.00€', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic, color: Colors.white))
                                                                        ]
                                                                    )
                                                                )
                                                            )
                                                          ]
                                                      ),
                                                      Row(
                                                          children: <Widget>[
                                                            Flexible(
                                                                flex: 2,
                                                                child: Container(
                                                                    alignment: Alignment.center,
                                                                    margin: const EdgeInsets.only(top: 10.0, left: 5.0),
                                                                    color: Colors.amber,
                                                                    child: const Text('2', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black))
                                                                )
                                                            ),
                                                            Flexible(
                                                                flex: 8,
                                                                child: Container(
                                                                    padding: const EdgeInsets.only(top: 10.0, left: 5.0),
                                                                    child: Column(
                                                                        children: const <Widget>[
                                                                          Text('JohnDoe', style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white)),
                                                                          Text('514.00€', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic, color: Colors.white))
                                                                        ]
                                                                    )
                                                                )
                                                            )
                                                          ]
                                                      ),
                                                      Row(
                                                          children: <Widget>[
                                                            Flexible(
                                                                flex: 2,
                                                                child: Container(
                                                                    alignment: Alignment.center,
                                                                    margin: const EdgeInsets.only(top: 10.0, left: 5.0),
                                                                    color: Colors.orange,
                                                                    child: const Text('3', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black))
                                                                )
                                                            ),
                                                            Flexible(
                                                                flex: 8,
                                                                child: Container(
                                                                    padding: const EdgeInsets.only(top: 10.0, left: 5.0),
                                                                    child: Column(
                                                                        children: const <Widget>[
                                                                          Text('Inconnu', style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white)),
                                                                          Text('216.47€', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic, color: Colors.white))
                                                                        ]
                                                                    )
                                                                )
                                                            )
                                                          ]
                                                      )
                                                    ]
                                                )
                                            )
                                          ]
                                      )
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
      );
    } else {
      return Column(
          children: <Widget>[
            Flexible(
                flex: 1,
                child: Container(
                    alignment: Alignment.center,
                    child: const Text('Actualités des candidats.es', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 20.0))
                )
            ),
            const Flexible(
                flex: 9,
                child: ActuCandidat()
            )
          ]
      );
    }
  }
}

class ProgrammeCandidat extends StatefulWidget {
  const ProgrammeCandidat({Key? key}) : super(key: key);

  @override
  State<ProgrammeCandidat> createState() => _ProgrammeCandidatState();
}

class _ProgrammeCandidatState extends State<ProgrammeCandidat> {
  int currentProgrammeCandidat = 3;

  @override
  Widget build(BuildContext context) {
    if(currentProgrammeCandidat == 1) {
      return Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: null,
                    child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/emmanuel_macron_grey.jpg"),
                        radius: 50
                    )
                  ),
                  GestureDetector(
                      onTap: updateProgrammeCandidatToSecond,
                      child: const CircleAvatar(
                          backgroundImage: AssetImage("assets/images/marine_le_pen.jpg"),
                          radius: 50
                      )
                  )
                ]
            )
          ),
          Flexible(
            flex: 9,
            child: SingleChildScrollView(
                child: Column(
                    children: const <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Text('Emmanuel Macron', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))
                      ),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                      Text('t1'),
                    ]
                )
            )
          )
        ]
      );
    } else if(currentProgrammeCandidat == 2) {
      return Column(
          children: <Widget>[
            Flexible(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                          onTap: updateProgrammeCandidatToFirst,
                          child: const CircleAvatar(
                              backgroundImage: AssetImage("assets/images/emmanuel_macron.jpg"),
                              radius: 50
                          )
                      ),
                      GestureDetector(
                          onTap: null,
                          child: const CircleAvatar(
                              backgroundImage: AssetImage("assets/images/marine_le_pen_grey.jpg"),
                              radius: 50
                          )
                      )
                    ]
                )
            ),
            Flexible(
                flex: 9,
                child: SingleChildScrollView(
                    child: Column(
                        children: const <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: 30.0),
                              child: Text('Marine Le Pen', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))
                          ),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                        ]
                    )
                )
            )
          ]
      );
    } else {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
                onTap: updateProgrammeCandidatToFirst,
                child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/emmanuel_macron.jpg"),
                    radius: 50
                )
            ),
            GestureDetector(
                onTap: updateProgrammeCandidatToSecond,
                child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/marine_le_pen.jpg"),
                    radius: 50
                )
            )
          ]
      );
    }
  }

  void updateProgrammeCandidatToFirst() {
    setState(() {
      currentProgrammeCandidat = 1;
    });
  }

  void updateProgrammeCandidatToSecond() {
    setState(() {
      currentProgrammeCandidat = 2;
    });
  }

}

class ActuCandidat extends StatefulWidget {
  const ActuCandidat({Key? key}) : super(key: key);

  @override
  State<ActuCandidat> createState() => _ActuCandidatState();
}

class _ActuCandidatState extends State<ActuCandidat> {
  int currentActuCandidat = 3;

  @override
  Widget build(BuildContext context) {
    if(currentActuCandidat == 1) {
      return Column(
          children: <Widget>[
            Flexible(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                          onTap: null,
                          child: const CircleAvatar(
                              backgroundImage: AssetImage("assets/images/emmanuel_macron_grey.jpg"),
                              radius: 50
                          )
                      ),
                      GestureDetector(
                          onTap: updateActuCandidatToSecond,
                          child: const CircleAvatar(
                              backgroundImage: AssetImage("assets/images/marine_le_pen.jpg"),
                              radius: 50
                          )
                      )
                    ]
                )
            ),
            Flexible(
                flex: 9,
                child: SingleChildScrollView(
                    child: Column(
                        children: <Widget>[
                          const Padding(
                              padding: EdgeInsets.only(top: 30.0),
                              child: Text('Emmanuel Macron', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))
                          ),
                          YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: 'dFKhWe2bBkM',
                              flags: const YoutubePlayerFlags(
                                autoPlay: false,
                                mute: false
                              )
                            ),
                            liveUIColor: Colors.amber,
                            showVideoProgressIndicator: true,
                          )
                        ]
                    )
                )
            )
          ]
      );
    } else if(currentActuCandidat == 2) {
      return Column(
          children: <Widget>[
            Flexible(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                          onTap: updateActuCandidatToFirst,
                          child: const CircleAvatar(
                              backgroundImage: AssetImage("assets/images/emmanuel_macron.jpg"),
                              radius: 50
                          )
                      ),
                      GestureDetector(
                          onTap: null,
                          child: const CircleAvatar(
                              backgroundImage: AssetImage("assets/images/marine_le_pen_grey.jpg"),
                              radius: 50
                          )
                      )
                    ]
                )
            ),
            Flexible(
                flex: 9,
                child: SingleChildScrollView(
                    child: Column(
                        children: const <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: 30.0),
                              child: Text('Marine Le Pen', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))
                          ),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                          Text('t1'),
                        ]
                    )
                )
            )
          ]
      );
    } else {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
                onTap: updateActuCandidatToFirst,
                child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/emmanuel_macron.jpg"),
                    radius: 50
                )
            ),
            GestureDetector(
                onTap: updateActuCandidatToSecond,
                child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/marine_le_pen.jpg"),
                    radius: 50
                )
            )
          ]
      );
    }
  }

  void updateActuCandidatToFirst() {
    setState(() {
      currentActuCandidat = 1;
    });
  }

  void updateActuCandidatToSecond() {
    setState(() {
      currentActuCandidat = 2;
    });
  }
}

