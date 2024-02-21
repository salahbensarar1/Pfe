import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
//import 'package:signupexample/SignUp/signupwithmail.dart';
//import 'package:flutter/animation';
import 'package:pfe2/administration/SignIn.dart';
import 'package:pfe2/administration/professeur/homeProf.dart';
import 'package:pfe2/animate/animation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignIn();
}

final studentReference =
    FirebaseDatabase.instance.reference().child('professeur');

class _SignIn extends State<SignIn> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final emailvalue = TextEditingController();
  late String mail, pass;
  bool secupass = true;

  @override
  Widget build(BuildContext context) {
    String apoge;
    /* String _resultdate = _valuedate == null
    ?DateFormat.yMd().format(salecteddate)
        :DateFormat.yMd().format(_valuedate);
    _resultdate = TextEditingController() as String ;*/
    return new Scaffold(
      //resizeToAvoidBottomInset: false,

      body: new Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/images/background3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(
                      1.0,
                      Container(
                        child: new RawMaterialButton(
                          onPressed: () {},
                          child: FlutterLogo(
                            size: 60,
                          ),
                          shape: new CircleBorder(),
                          elevation: 20.0,
                          //shadows
                          fillColor: Colors.white,
                          padding: EdgeInsets.all(35.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FadeAnimation(
                1.5,
                Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.only(top: 10, bottom: 14),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(35),
                      )),
                  child: Column(
                    key: _formkey,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                        ),
                        child: Form(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                // ignore: missing_return
                                controller: _userController,
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return 'Username obligatoire';
                                  }
                                },

                                onSaved: (input) => mail = input!,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Username',
                                  labelStyle: TextStyle(
                                      color: Colors.brown, fontSize: 20),
                                  icon: Icon(
                                    Icons.mail,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  hintText: 'Entrer ton Username',
                                ),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: _passController,
                                // ignore: missing_return
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return 'Mot de passe obligatoire';
                                  }
                                },

                                onSaved: (input) => pass = input!,

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Mot de passe',
                                  labelStyle: TextStyle(
                                      color: Colors.brown, fontSize: 20),
                                  icon: Icon(Icons.lock,
                                      color: Colors.black, size: 25),
                                  //focusColor: Colors.white,
                                  hintText: 'Entrer le mot de passe',

                                  hintStyle: TextStyle(fontSize: 20),
                                  suffixIcon: IconButton(
                                    icon: Icon(secupass
                                        ? Icons.remove_red_eye
                                        : Icons.security),
                                    onPressed: () {
                                      setState(() {
                                        secupass = !secupass;
                                      });
                                    },
                                  ),
                                ),
                                obscureText: secupass,
                                style: TextStyle(
                                    color: Colors.black,
                                    //backgroundColor: Colors.brown,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 26,
                              ),
                              ElevatedButton(
                                onPressed: () => readData(),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  backgroundColor: Colors.deepOrangeAccent,
                                  padding: EdgeInsets.all(10),
                                  textStyle: TextStyle(
                                      fontSize: 29, color: Colors.white),
                                ),
                                child: Text('Login'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void readData() {
    final formState = _formkey.currentState;
    String _user = _userController.text.toString();
    String _pass = _passController.text.toString();
    try {
      studentReference
          .orderByChild("user name")
          .equalTo(_user)
          .once()
          .then((DataSnapshot snapshot) {
            if (snapshot.value != null) {
              studentReference
                  .orderByChild("Password")
                  .equalTo(_pass)
                  .once()
                  .then((DataSnapshot dataSnapshot) {
                    if (dataSnapshot.value != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new SignInP(_user, _pass)));
                    }
                  } as FutureOr Function(DatabaseEvent value));
            } else {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignInL()));
            }
          } as FutureOr Function(DatabaseEvent value));
    } catch (e) {
      print(e.toString());
    }
  }
}
