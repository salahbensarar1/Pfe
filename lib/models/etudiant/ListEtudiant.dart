import 'dart:async';
import 'package:firebase_database/firebase_database.dart'; //
import 'package:flutter/material.dart';
import 'package:pfe2/models/etudiant/Etudiant.dart';
import 'package:pfe2/models/etudiant/homeEtu.dart';

class ListEtudiant extends StatefulWidget {
  @override
  _ListEtudiantState createState() => _ListEtudiantState();
}

final etudiantReference = FirebaseDatabase.instance.reference().child(
    'etudiant'); //on va utiliser etudiant comme base de donnes ou objet du base de donnes

class _ListEtudiantState extends State<ListEtudiant> {
  List<Etudiant> element; //afin de creer une liste de type etudiant
  StreamSubscription<
      Event /*from class event*/> _EtudiantAjoute; //quand on ajoute un etudiant automatiquement il fait la mise à jour
  StreamSubscription<Event /*from class event*/> _EtudiantModifie;

  //ici il faut like configurer Database
  //cad qand un utilisateur ouvre l application il va automatiquement acceder a l'utilisation de Database
  @override
  void initState() {
    super.initState();
    element = new List();
    _EtudiantAjoute = etudiantReference.onChildAdded.listen(_etudiantAjoute);
    _EtudiantModifie = etudiantReference.onChildAdded.listen(_etudiantModifie);
  }

  @override
  void dispose() {
    //like close de database la fermeture de la base de donnes
    super.dispose();
    _EtudiantAjoute.cancel();
    _EtudiantModifie.cancel();
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
            'Liste d‘Etudiant',
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
                subtitle:
                Text('${element[positon].Apoge}',

                style:
                TextStyle(
                color: Colors.indigo,
                fontSize: 18.0,
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
                            onPressed:() => _supprimeEtudiant(context,element[positon],positon))
                      ],
                    ),
                  ),
                  onTap: ()=> _allezEtudiant(context,element[positon]),
                ),
                ],
                );
              }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.add,color: Colors.black),
          onPressed: ()=>_creeNvEtudiant(context) ,
        ),
      ),
    );
  }
//************************************************************************************************************
  void _etudiantAjoute(Event event){
    setState(() {
      element.add(new Etudiant.fromSnapShot(event.snapshot));
    });

  }
  //************************************************************************************************************
  void _etudiantModifie(Event event){
    var valEtudiant = element.singleWhere((etudiant)=>etudiant.id == event.snapshot.key);
    setState(() {
      element[element.indexOf(valEtudiant) ] = new Etudiant.fromSnapShot(event.snapshot);
    });
  }
  //************************************************************************************************************
  void _supprimeEtudiant(BuildContext context,Etudiant etudiant,int position)async{
    await etudiantReference.child(etudiant.id).remove().then((_){
      setState(() {
        element.removeAt(position);
      });
    });

  }
  //************************************************************************************************************
  void _allezEtudiant(BuildContext context,Etudiant etudiant)async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => Home(etudiant)  )
    );
  }
  //************************************************************************************************************
  void _creeNvEtudiant(BuildContext  context)async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => Home(Etudiant(null,'','','',''))  )
    );
  }

}
