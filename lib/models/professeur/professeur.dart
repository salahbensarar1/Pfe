import 'package:firebase_database/firebase_database.dart';


class Professeur {
  String _id;
  String _Usrname;
  String _nom;
  String _prenom;
  String _password;

  Professeur(
      this._id,
      this._Usrname, //il va le remplir automatiquement
      this._nom,
      this._prenom,
      this._password);
  Professeur.map(dynamic object){
    this._id = object["id"];
    this._Usrname=object["user name"];//il va reserver une place dans base de donnes
    this._nom=object["Nom"];
    this._prenom=object["Prenom"];
    this._password=object["Password"];
  }
  String get id => _id;
  String get Usrname => _Usrname; //pour la prendre de l'utilisateur
  String get nom => _nom;
  String get prenom => _prenom;
  String get password => _password;
  Professeur.fromSnapShot(DataSnapshot snapshot){
    _id=snapshot.key; //pour lire les donnes de la base de données on fait le snap
    _Usrname=snapshot.value["user name"];
    _nom=snapshot.value["Nom"];
    _prenom=snapshot.value["Prenom"];
    _password=snapshot.value["Password"];
  }

}
