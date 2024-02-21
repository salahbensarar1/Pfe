import 'dart:async';
import 'package:firebase_database/firebase_database.dart'; //
import 'package:flutter/material.dart';
import 'package:pfe2/animate/animation.dart';
import 'package:pfe2/models/etudiant/Etudiant.dart';
//import 'package:pfe2/Etudiant/homeEtu.dart';

class Home extends StatefulWidget {
  final Etudiant etudiant;
  Home(this.etudiant);
  @override
  _HomeState createState() => new _HomeState();
}


final etudiantReference = FirebaseDatabase.instance.reference().child(
    'etudiant'); //on va utiliser etudiant comme base de donnes ou objet du base de donnes

class _HomeState extends State<Home> {
  TextEditingController _apogeController;
  TextEditingController _nomController;
  TextEditingController _prenomController;
  TextEditingController _datenaissController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apogeController = new TextEditingController(text : widget.etudiant.Apoge);
    _nomController = new TextEditingController(text : widget.etudiant.nom);
    _prenomController = new TextEditingController(text : widget.etudiant.prenom);
    _datenaissController = new TextEditingController(text : widget.etudiant.DateN);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Espace etudiant'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        margin: EdgeInsets.only(top:15),
        alignment: Alignment.center,
        child: FadeAnimation(
          1.6,
           SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  autofocus: false,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.cyan,
                  ),
                  controller: _apogeController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'code apoge',
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                TextField(
                  autofocus: false,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.cyan,
                  ),
                  controller: _nomController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Nom',
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),


              TextField(
                autofocus: false,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.cyan,
                ),
                controller: _prenomController,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Prenom',
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),

                TextField(
                  autofocus: false,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.cyan,
                  ),
                  controller: _datenaissController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Date de naissance',
                    helperText: 'MM/DD/YYYY'
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),


                FlatButton(
                    onPressed:(){
                      if(widget.etudiant.id != null){
                        etudiantReference.child(widget.etudiant.id).set({
                          'code apoge' : _apogeController.text,
                        'Nom' : _nomController.text,
                        'Prenom' : _prenomController.text,
                        'Date de naissance' : _datenaissController.text,
                        }).then((_) => {
                          Navigator.pop(context)
                        });
                      }else{
                        etudiantReference.push().set({
                          'code apoge' : _apogeController.text,
                          'Nom' : _nomController.text,
                          'Prenom' : _prenomController.text,
                          'Date de naissance' : _datenaissController.text,
                        }).then((_) => {
                        Navigator.pop(context)
                        });
                      }
                    },
                    child: (widget.etudiant.id != null) ? Text('Modifier') : Text('Ajouter')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
