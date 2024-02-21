import 'dart:async';
import 'dart:html';
import 'package:firebase_database/firebase_database.dart'; //
import 'package:flutter/material.dart';
import 'package:pfe2/models/cour/cour.dart';
import 'package:pfe2/models/cour/screen_Ajout.dart';
import 'package:pfe2/models/etudiant/homeEtu.dart';
import 'package:url_launcher/url_launcher.dart';

class DiplayCour extends StatefulWidget {
  @override
  _DiplayCourState createState() => _DiplayCourState();
}

final CourReference = FirebaseDatabase.instance.reference().child(
    'Cour'); //on va utiliser etudiant comme base de donnes ou objet du base de donnes

class _DiplayCourState extends State<DiplayCour> {
  late List<Cour> element; //afin de creer une liste de type etudiant
  late StreamSubscription<Event /*from class event*/ >
      _AjouteCour; //quand on ajoute un etudiant automatiquement il fait la mise à jour
  late StreamSubscription<Event /*from class event*/ > _ModifieCour;

  //ici il faut like configurer Database
  //cad qand un utilisateur ouvre l application il va automatiquement acceder a l'utilisation de Database
  @override
  void initState() {
    super.initState();
    List<Cour> element = [];
    _AjouteCour = CourReference.onChildAdded
            .listen(_courAjoute as void Function(DatabaseEvent event)?)
        as StreamSubscription<Event>;
    _ModifieCour = CourReference.onChildAdded
            .listen(_Modifiecour as void Function(DatabaseEvent event)?)
        as StreamSubscription<Event>;
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
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.purpleAccent,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 250.0, top: 20),
            child: Image(
              image: AssetImage('assets/images/wah.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          title: Text(
            'Liste des cours',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: element.length,
              padding: EdgeInsets.only(top: 22.0, left: 16.0),
              itemBuilder: (context, positon) {
                return Column(
                  children: <Widget>[
                    Divider(
                      height: 18.0,
                    ),
                    ListTile(
                      title: Text(
                        '${element[positon].categ}',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.w600,
                          fontSize: 22.0,
                        ),
                      ),
                      subtitle: Text(
                        '${element[positon].link}',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 18.0,
                        ),
                      ),
                      leading: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 0,
                            ),
                          ],
                        ),
                      ),
                      onTap: () => _lunchinbrowser,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

//************************************************************************************************************
  void _courAjoute(Event event) {
    setState(() {
      element.add(new Cour.fromSnapShot(event.snapshot));
    });
  }

  //************************************************************************************************************
  void _Modifiecour(Event event) {
    var valCour = element.singleWhere((cour) => cour.id == event.snapshot.key);
    setState(() {
      element[element.indexOf(valCour)] = new Cour.fromSnapShot(event.snapshot);
    });
  }

  //************************************************************************************************************
  void _allezCour(BuildContext context, Cour cour) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeC(cour)));
  }

  //************************************************************************************************************
  void _creeNvCour(BuildContext context) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomeC(Cour(null, '', '', ''))));
  }

//************************************************************************************************************
  Future<void> _lunchinbrowser(Cour cour) async {
    if (await canLaunch(cour.link)) {
      await launch(
        cour.link,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw ' impossible d‘acceder ce lien ${cour.link}';
    }
  }
}
