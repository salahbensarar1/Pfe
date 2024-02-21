import 'dart:async';
import 'package:firebase_database/firebase_database.dart'; //
import 'package:flutter/material.dart';
import 'package:pfe2/models/cour/cour.dart';
import 'package:pfe2/models/cour/screen_Ajout.dart';
import 'package:pfe2/models/etudiant/homeEtu.dart';



class ListCour extends StatefulWidget {
  @override
  _ListCourState createState() => _ListCourState();
}

final CourReference = FirebaseDatabase.instance.reference().child(
    'Cour'); //on va utiliser etudiant comme base de donnes ou objet du base de donnes

class _ListCourState extends State<ListCour> {
  List<Cour> element; //afin de creer une liste de type etudiant
  StreamSubscription<
      Event /*from class event*/> _AjouteCour; //quand on ajoute un etudiant automatiquement il fait la mise à jour
  StreamSubscription<Event /*from class event*/> _ModifieCour;

  //ici il faut like configurer Database
  //cad qand un utilisateur ouvre l application il va automatiquement acceder a l'utilisation de Database
  @override
  void initState() {
    super.initState();
    element = new List();
    _AjouteCour = CourReference.onChildAdded.listen(_courAjoute);
    _ModifieCour = CourReference.onChildAdded.listen(_Modifiecour);
  }

  @override
  void dispose() {
    //like close de database la fermeture de la base de donnes
    super.dispose();
    _AjouteCour.cancel();
    _ModifieCour.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cour"),
          centerTitle: true,
        ),
        body: Container(
          child: ListView.builder(
              itemCount: element.length,
              padding: EdgeInsets.only(top: 24.0,left: 25.0),
              itemBuilder: (context, positon) {
                return Column(
                  children: <Widget>[
                    Divider(height: 14.0,),
                    ListTile(
                      title:
                      Text('${element[positon].title}',
                        style:
                        TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.w600,

                          fontSize: 22.0,
                        ),

                      ),
                      subtitle:
                      Text('${element[positon].categ}',

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
                              radius: 8,

                              /*child: Text(

                          ),*/
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            IconButton(icon: Icon(Icons.delete,color: Colors.red,size: 25,),
                                onPressed:() => _supprimeCour(context,element[positon],positon))
                          ],
                        ),
                      ),
                      onTap: ()=> _allezCour(context,element[positon]),
                    ),
                  ],
                );
              }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,color: Colors.indigo),
          onPressed: ()=>_creeNvCour(context) ,
        ),
      ),
    );
  }
//************************************************************************************************************
  void _courAjoute(Event event){
    setState(() {
      element.add(new Cour.fromSnapShot(event.snapshot));
    });

  }
  //************************************************************************************************************
  void _Modifiecour(Event event){
    var valCour = element.singleWhere((cour)=>cour.id == event.snapshot.key);
    setState(() {
      element[element.indexOf(valCour) ] = new Cour.fromSnapShot(event.snapshot);
    });
  }
  //************************************************************************************************************
  void _supprimeCour(BuildContext context,Cour cour,int position)async{
    await CourReference.child(cour.id).remove().then((_){
      setState(() {
        element.removeAt(position);
      });
    });

  }
  //************************************************************************************************************
  void _allezCour(BuildContext context,Cour cour)async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomeC(cour)  )
    );
  }
  //************************************************************************************************************
  void _creeNvCour(BuildContext  context)async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomeC(Cour(null,'','',''))  )
    );
  }

}
