import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const HomePage(title: 'Ma première application')
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Icon _likeHeart = const Icon(Icons.favorite_border, color: Colors.white);
  bool _likeBool = false;

  String _affichage = "0: Accueil";
  int _indexSelectionne = 0;

  void _likeThis() {
    setState(() {
      if(_likeBool) {
        _likeHeart = const Icon(Icons.favorite_border, color: Colors.white);
        _likeBool = false;
      } else {
        _likeHeart = const Icon(Icons.favorite, color: Colors.white);
        _likeBool = true;
      }
    });
  }

  void _itemClique(int index) {
    setState(() {
      _indexSelectionne = index;
      switch(_indexSelectionne) {
        case 0:
          {
            _affichage = '$_indexSelectionne: Accueil';
          }
          break;
        case 1:
          {
            _affichage = '$_indexSelectionne: Mon compte';
          }
          break;
        case 2:
          {
            _affichage = '$_indexSelectionne: Statistiques';
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton (
            icon: _likeHeart,
            onPressed: _likeThis
          )
        ],
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _likeThis,
        backgroundColor: Colors.red,
        child: _likeHeart
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${_affichage}', style: TextStyle(color: Colors.red, fontSize: 40.0))
          ],
        )
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu de navigation',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
            ),
            Text('Lien 1'),
            Text('Lien 2'),
            Text('Lien 3'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Accueil'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle, color: Colors.white),
              label: 'Mon compte'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment, color: Colors.white),
              label: 'Statistiques'
          ),
        ],
        backgroundColor: Colors.red,
        onTap: _itemClique,
        currentIndex: _indexSelectionne
      ),
    );
  }
}
