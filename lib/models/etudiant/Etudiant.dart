import 'package:firebase_database/firebase_database.dart';


class Etudiant {
  String _id;
  String _Apoge;
  String _nom;
  String _prenom;
  String _DateN;

  Etudiant(
      this._id,
      this._Apoge, //il va le remplir automatiquement
      this._nom,
      this._prenom,
      this._DateN);
  Etudiant.map(dynamic object){
    this._id = object["id"];
    this._Apoge=object["code apoge"];//il va reserver une place dans base de donnes
    this._nom=object["Nom"];
    this._prenom=object["Prenom"];
    this._DateN=object["Date de naissance"];
  }
  String get id => _id;
  String get Apoge => _Apoge; //pour la prendre de l'utilisateur
  String get nom => _nom;
  String get prenom => _prenom;
  String get DateN => _DateN;
  Etudiant.fromSnapShot(DataSnapshot snapshot){
    _id=snapshot.key; //pour lire les donnes de la base de données on fait le snap
    _Apoge=snapshot.value["code apoge"];
    _nom=snapshot.value["Nom"];
    _prenom=snapshot.value["Prenom"];
    _DateN=snapshot.value["Date de naissance"];
  }

}
