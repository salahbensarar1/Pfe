import 'dart:async';
import 'package:firebase_database/firebase_database.dart'; //
import 'package:flutter/material.dart';
import 'package:pfe2/animate/animation.dart';
import 'package:pfe2/models/cour/cour.dart';



class HomeC extends StatefulWidget {
  final Cour cour;
  HomeC(this.cour);
  @override
  _HomeCState createState() => new _HomeCState();
}


final courReference = FirebaseDatabase.instance.reference().child(
    'Cour'); //on va utiliser etudiant comme base de donnes ou objet du base de donnes

class _HomeCState extends State<HomeC> {
  TextEditingController _titleController;
  TextEditingController _linkController;
  TextEditingController _categorieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = new TextEditingController(text : widget.cour.title);
    _linkController = new TextEditingController(text : widget.cour.link);
    _categorieController = new TextEditingController(text : widget.cour.categ);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestion du cour'),
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
                  controller: _titleController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.title),
                    labelText: 'Titre du cour',
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                TextField(
                  autofocus: false,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.cyan,
                  ),
                  controller: _linkController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.link),
                    labelText: 'Lien du cour',
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),


                TextField(
                  autofocus: false,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.cyan,
                  ),
                  controller: _categorieController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.category_sharp
                    ),
                    labelText: 'Categorie',
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),


                FlatButton(
                    onPressed:(){
                      if(widget.cour.id != null){
                        courReference.child(widget.cour.id).set({
                          'title' : _titleController.text,
                          'link' : _linkController.text,
                          'categorie' : _categorieController.text,
                        }).then((_) => {
                          Navigator.pop(context)
                        });
                      }else{
                        courReference.push().set({
                          'title' : _titleController.text,
                          'link' : _linkController.text,
                          'categorie' : _categorieController.text,
                        }).then((_) => {
                          Navigator.pop(context)
                        });
                      }
                    },
                    child: (widget.cour.id != null) ? Text('Modifier') : Text('Ajouter')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
