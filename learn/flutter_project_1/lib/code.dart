class Acheteur<T extends Ordinateur> {
  String _prenom;
  String _nom;
  int _identifiantClient;
  T ordinateurClient;

  Acheteur(this._prenom, this._nom, this._identifiantClient, this.ordinateurClient);

  String get prenom => _prenom;
  set prenom(String value) {
    prenom = value;
  }

  String get nom => _nom;
  set nom(String value) {
    nom = value;
  }

  int get identifiantClient => _identifiantClient;
  set identifiantClient(int value) {
    identifiantClient = value;
  }

  T getOrdinateur() {
    return this.ordinateurClient;
  }
}

class Ordinateur {
  String _marque;
  String _carteGraphique;
  String _processeur;
  String _ram;
  double _prixHT;

  Ordinateur(this._marque, this._carteGraphique, this._processeur, this._ram, this._prixHT);

  String get marque => _marque;
  set marque(String value) {
    marque = value;
  }

  String get carteGraphique => _carteGraphique;
  set carteGraphique(String value) {
    carteGraphique = value;
  }

  String get processeur => _processeur;
  set processeur(String value) {
    processeur = value;
  }

  String get ram => _ram;
  set ram(String value) {
    ram = value;
  }

  double get prixHT => _prixHT;
  set prixHT(double value) {
    prixHT = value;
  }


}

extension OrdinateurInfos on Ordinateur {
  double prixTTC() => 1;
}

class OrdinateurFnac extends Ordinateur {
  String constructeur;

  OrdinateurFnac(this.constructeur, String marque, String carteGraphique, String processeur, String ram, double prixHT): super(marque, carteGraphique, processeur, ram, prixHT);
}

class OrdinateurDarty extends Ordinateur {
  int dureeGarantie;

  OrdinateurDarty(this.dureeGarantie, String marque, String carteGraphique, String processeur, String ram, double prixHT): super(marque, carteGraphique, processeur, ram, prixHT);
}