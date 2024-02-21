import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pfe2/Etudiant/introEtu.dart';
import 'package:pfe2/administration/professeur/home.dart';

import 'package:pfe2/animate/animation.dart';
import 'package:pfe2/models/cour/DisplayCours.dart';

class Login extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

final studentReference =
    FirebaseDatabase.instance.reference().child('etudiants');

class _LoginPage extends State<Login> {
/* List<Etudiant> student;
  StreamSubscription<Event> _addData;
  StreamSubscription<Event> _modifyData;
 final studentReference = FirebaseDatabase.instance.reference().child('Etudiants');*/

  TextEditingController _apogeeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  DateTime _currentdate = new DateTime.now(); // pour afficher la date actuelle
  late DateTime _dateTime;
  bool _secureText = true;
  late String _time;

  //Query _etudiantQuery;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _formatdate = _dateTime == null
        ? DateFormat.yMd().format(_currentdate)
        : DateFormat.yMd().format(_dateTime);
    return Scaffold(
      backgroundColor: Color.fromRGBO(2, 7, 23, 1),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background3.png"),
                fit: BoxFit.cover)),
        width: double.infinity,
        height: double.infinity,
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 190, 30, 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // Login in the start
              mainAxisAlignment: MainAxisAlignment.center,
              // Login in the center
              children: <Widget>[
                FadeAnimation(
                  1.2,
                  Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                  1.9,
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      key: _formkey,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey), //Colors.grey[300]
                            ),
                          ),
                          child: TextField(
                            controller: _apogeeController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.grey.withOpacity(.8)),
                              labelText: "Code Apogée",
                              // au clique il montant en haut
                              hintText: "Code Apogée",
                              //  => joue le rôle du placeholder dans html5
                              suffixIcon: IconButton(
                                icon: Icon(_secureText
                                    ? Icons.remove_red_eye
                                    : Icons.security),
                                onPressed: () {
                                  setState(() {
                                    _secureText = !_secureText;
                                  });
                                },
                              ),
                            ),
                            obscureText: _secureText,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(),
                          child: TextField(
                            controller: _dateController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(.8)),
                                //labelText: "Date de Naissance", // au clique il montant en haut
                                hintText: "$_formatdate",
                                //  => joue le rôle du placeholder dans html5

                                suffixIcon: IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1990),
                                            lastDate: DateTime(2222))
                                        .then((date) {
                                      setState(() {
                                        _dateTime = date!;
                                        if (date != null) {
                                          _dateController.text =
                                              DateFormat.yMd().format(date);
                                        }
                                      });
                                    });
                                  },
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                FadeAnimation(
                  1.8,
                  Center(
                    child: Container(
                      child: Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          child: Text('Se connecter'),
                          onPressed: () => readData(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                FadeAnimation(
                  1.7,
                  Container(
                    //margin: EdgeInsets.all(30),
                    child: TextButton(
                      child: Text(
                        'compte administrateur',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignInL()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void readData() {
    final formState = _formkey.currentState;
    String _apoge = _apogeeController.text.toString();
    String _dateN = _dateController.text.toString();
    try {
      studentReference
          .orderByChild("code apoge")
          .equalTo(_apoge)
          .once()
          .then((DataSnapshot snapshot) {
            if (snapshot.value != null) {
              studentReference
                  .orderByChild("Date de naissance")
                  .equalTo(_dateN)
                  .once()
                  .then((DataSnapshot dataSnapshot) {
                    if (dataSnapshot.value != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DiplayCour())); //new SignIn(_apoge,_dateN)));
                    }
                  } as FutureOr Function(DatabaseEvent value));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DiplayCour())); //SignIn(_apoge,_dateN)));
            }
          } as FutureOr Function(DatabaseEvent value));
    } catch (e) {
      print(e.toString());
    }
  }
}
