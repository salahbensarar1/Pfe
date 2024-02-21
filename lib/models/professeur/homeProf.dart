import 'dart:async';
import 'package:firebase_database/firebase_database.dart'; //
import 'package:flutter/material.dart';
import 'package:pfe2/animate/animation.dart';
import 'package:pfe2/models/etudiant/Etudiant.dart';
import 'package:pfe2/models/professeur/professeur.dart';
//import 'package:pfe2/Etudiant/homeEtu.dart';

class HomeP extends StatefulWidget {
  final Professeur prof;
  HomeP(this.prof);
  @override
  _HomePState createState() => new _HomePState();
}


final etudiantReference = FirebaseDatabase.instance.reference().child(
    'professeur'); //on va utiliser etudiant comme base de donnes ou objet du base de donnes

class _HomePState extends State<HomeP> {
  TextEditingController _usrnamController;
  TextEditingController _nomController;
  TextEditingController _prenomController;
  TextEditingController _passController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usrnamController = new TextEditingController(text : widget.prof.Usrname);
    _nomController = new TextEditingController(text : widget.prof.nom);
    _prenomController = new TextEditingController(text : widget.prof.prenom);
    _passController = new TextEditingController(text : widget.prof.password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Espace Professeur'),
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
                  controller: _usrnamController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'User name',
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
                  controller: _passController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Entrer un mot de pass',
                      helperText: '*******'
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),


                FlatButton(
                    onPressed:(){
                      if(widget.prof.id != null){
                        etudiantReference.child(widget.prof.id).set({
                          'user name' : _usrnamController.text,
                          'Nom' : _nomController.text,
                          'Prenom' : _prenomController.text,
                          'Password' : _passController.text,
                        }).then((_) => {
                          Navigator.pop(context)
                        });
                      }else{
                        etudiantReference.push().set({
                          'user name' : _usrnamController.text,
                          'Nom' : _nomController.text,
                          'Prenom' : _prenomController.text,
                          'Password' : _passController.text,
                        }).then((_) => {
                          Navigator.pop(context)
                        });
                      }
                    },
                    child: (widget.prof.id != null) ? Text('Modifier') : Text('Ajouter')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
