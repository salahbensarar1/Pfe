import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class NvCour extends StatefulWidget {
  NvCour({required this.app});
  final FirebaseApp app;
  @override
  _NvCourState createState() => _NvCourState();
}

class _NvCourState extends State<NvCour> {
  late String Ncr; //, contenu;
  final Nomcour = 'Titre de cour';
  //String duree;
  final NomCourController = TextEditingController();
  //final UrlCourController = TextEditingController();
//  final dureeCourController = TextEditingController();
  final ReferenceDatbase = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    final id = ReferenceDatbase.reference();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        // afin d'ecraser ou bien de reparer le overflowd du button
        appBar: AppBar(
          title: Center(
            child: Text(
              'Nouveau cour',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
          backgroundColor: Colors.indigo,
        ),

        body: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 80),
          child: SizedBox(
            width: 360,
            child: Form(
              child: Column(
                children: <Widget>[
                  Text(
                    Nomcour,
                    style: TextStyle(fontSize: 30),
                  ),
                  TextFormField(
                    controller: NomCourController,
                    decoration: InputDecoration(
                        hintText: 'entrer un nouveau cour',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5.0),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 0.0, right: 26, left: 26),
                    child: TextFormField(
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: 'entrer le contenu de cour',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5.0),
                        ),
                      ),
                      //controller: UrlCourController,
                      /*onChanged: (valeur) {
                        setState(() {
                          contenu = valeur;
                        });*/
                      //},
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 26, left: 26),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      //afin d'entrer seulement les nombres dans le scaffold
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintText: 'entrer la durée du cour',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 3.0,
                            ),
                          )),
                      /*controller: dureeCourController,
                      onChanged: (valeur) {
                        setState(() {
                          duree = valeur; // afin de transformer le variable valeur en entier
                        });
                      },*/
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      id
                          .child('Cours')
                          .push()
                          .child(Ncr)
                          .set(Nomcour)
                          .asStream();
                      NomCourController.clear();
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: Text(
                      'Enregistrer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
