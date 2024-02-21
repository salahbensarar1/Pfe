import 'dart:async';
import 'package:firebase_database/firebase_database.dart'; //
import 'package:flutter/material.dart';
import 'package:pfe2/models/etudiant/Etudiant.dart';
import 'package:pfe2/models/etudiant/homeEtu.dart';
import 'package:pfe2/models/professeur/homeProf.dart';
import 'package:pfe2/models/professeur/professeur.dart';

import 'professeur.dart';

class ListProf extends StatefulWidget {
  @override
  _ListProfState createState() => _ListProfState();
}

final profReference = FirebaseDatabase.instance.reference().child(
    'professeur'); //on va utiliser etudiant comme base de donnes ou objet du base de donnes

class _ListProfState extends State<ListProf> {
  List<Professeur> element; //afin de creer une liste de type etudiant
  StreamSubscription<
      Event /*from class event*/> _ProfAjoute; //quand on ajoute un etudiant automatiquement il fait la mise à jour
  StreamSubscription<Event /*from class event*/> _ProfModifie;

  //ici il faut like configurer Database
  //cad qand un utilisateur ouvre l application il va automatiquement acceder a l'utilisation de Database
  @override
  void initState() {
    super.initState();
    element = new List();
    _ProfAjoute = profReference.onChildAdded.listen(_profAjoute);
    _ProfModifie = profReference.onChildAdded.listen(_profModifie);
  }

  @override
  void dispose() {
    //like close de database la fermeture de la base de donnes
    super.dispose();
    _ProfAjoute.cancel();
    _ProfModifie.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.purpleAccent,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left:250.0,top: 20),
            child: Image(
              image: AssetImage('assets/images/wah.png'),
              fit: BoxFit.fitHeight,),
          ),
          title: Text(
            'Liste de Prof',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        body:
        Container(
          child: ListView.builder(
              itemCount: element.length,
              padding: EdgeInsets.only(top: 24.0,left: 25.0),
              itemBuilder: (context, positon) {
                return Column(
                  children: <Widget>[
                    Divider(height: 14.0,),
                    ListTile(
                      title:
                      Text('${element[positon].nom} ${element[positon].prenom}',
                        style:
                        TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.w600,

                          fontSize: 22.0,
                        ),

                      ),

                      leading: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(

                              backgroundColor: Colors.orangeAccent,
                              radius: 10,

                              /*child: Text(

                          ),*/
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            IconButton(icon: Icon(Icons.delete,color: Colors.red,size: 25,),
                                onPressed:() => _supprimeprof(context,element[positon],positon))
                          ],
                        ),
                      ),
                      onTap: ()=> _allezProf(context,element[positon]),
                    ),
                  ],
                );
              }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.add,color: Colors.black),
          onPressed: ()=>_creeNvProf(context) ,
        ),
      ),
    );
  }
//************************************************************************************************************
  void _profAjoute(Event event){
    setState(() {
      element.add(new Professeur.fromSnapShot(event.snapshot));
    });

  }
  //************************************************************************************************************
  void _profModifie(Event event){
    var valProf = element.singleWhere((prof)=>prof.id == event.snapshot.key);
    setState(() {
      element[element.indexOf(valProf) ] = new Professeur.fromSnapShot(event.snapshot);
    });
  }
  //************************************************************************************************************
  void _supprimeprof(BuildContext context,Professeur prof,int position)async{
    await profReference.child(prof.id).remove().then((_){
      setState(() {
        element.removeAt(position);
      });
    });

  }
  //************************************************************************************************************
  void _allezProf(BuildContext context,Professeur prof)async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomeP(prof)  )
    );
  }
  //************************************************************************************************************
  void _creeNvProf(BuildContext  context)async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomeP(Professeur(null,'','','',''))  )
    );
  }

}
