import 'package:flutter/material.dart';
import '../data/user.dart';

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
          children: const <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: SingleChildScrollView(
                  child: Authentification()
                )
              )
            )
          ]
        )
      ),
    );
  }
}

class Authentification extends StatefulWidget {
  const Authentification({Key? key}) : super(key: key);

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  int authStep = 1;

  User user = User();
  late UserProvider provider;

  @override
  void initState() {
    super.initState();
    getInstance();
  }

  @override
  void dispose() {
    super.dispose();
    provider.close();
  }

  Future<UserProvider> getInstance() async {
    provider = UserProvider.instance;
    return provider;
  }

  @override
  Widget build(BuildContext context) {
    if(user.toMap()['id'] != null && user.toMap()['username'] != null && user.toMap()['password'] != null) {
      authStep = 3;
    }
    if(authStep == 1) {
      return Column(
          children: <Widget>[
            const Login(),
            Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: GestureDetector(
                    onTap: () {
                      print('test');
                    },
                    child: TextButton(
                        style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
                        onPressed: setAuthStepToReg,
                        child: const Text('Pas encore inscrit ?', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 20.0, color: Colors.white))
                    )
                )
            )
          ]
      );
    } else if(authStep == 2) {
      return Column(
          children: <Widget>[

            const Icon(Icons.people),
            const Text('Inscription', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 20.0)),
            const Text('Vous souhaitez nous rejoindre ? Inscrivez-vous !', style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic)),
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
            const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      hintText: 'Répétez votre mot de passe'
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
                    child: const Text('Inscription', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 20.0, color: Colors.white))
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
                        onPressed: setAuthStepToLog,
                        child: const Text('Retour à la connexion', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 20.0, color: Colors.white))
                    )
                )
            )
          ]
      );
    } else {
      return Container(child: null);
    }
  }

  void setAuthStepToReg() {
    setState(() {
      authStep = 2;
    });
  }

  void setAuthStepToLog() {
    setState(() {
      authStep = 1;
    });
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int loginStep = 1;
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Icon(Icons.people),
        const Text('Connexion', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 20.0)),
        const Text('Vous possédez déjà un compte ? Connectez-vous !', style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic)),
        Form(
            key: _loginFormKey,
            child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                          enabled: (loginStep == 1 ? true : false),
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'Veuillez saisir un nom d\'utilisateur !';
                            }
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: 'Nom d\'utilisateur'
                          )
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                        enabled: (loginStep == 1 ? true : false),
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return 'Veuillez saisir un mot de passe !';
                          }
                        },
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            hintText: 'Mot de passe'
                        ),
                        enableSuggestions: false,
                        autocorrect: false,
                        obscureText: true,
                      )
                  ),
                  Visibility(
                    visible: (loginStep == 1 ? true : false),
                    child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.login, color: Colors.white),
                          style: TextButton.styleFrom(backgroundColor: Colors.blue),
                          onPressed: () {
                            if(_loginFormKey.currentState!.validate()) {
                              _startLoginProcess();
                            }
                          },
                          label: const Text('Connexion', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 20.0, color: Colors.white)),
                        )
                    )
                  ),
                  Visibility(
                      visible: (loginStep == 2 ? true : false),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: ElevatedButton(
                            style: TextButton.styleFrom(backgroundColor: Colors.grey),
                            onPressed: null,
                            child: const Text('Veuillez patienter...', style: TextStyle(fontFamily: 'Coolvetica', fontSize: 20.0, color: Colors.white)),
                          )
                      )
                  ),
                ]
            )
        )
      ]
    );
  }

  void _startLoginProcess() {
    setState(() {
      loginStep = 2;
    });
  }

  void _stopLoginProcess() {
    setState(() {
      loginStep = 1;
    });
  }
}

