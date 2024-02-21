//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfe2/animate/animation.dart';

//import 'package:projet1/professeur/signIn.dart';
import 'professeur/home.dart';

class Acladmin extends StatefulWidget {
  /*String email;
  String passw;
  Acladmin(this.email,this.passw);*/
  @override
  State<StatefulWidget> createState() => Acladmin2();
}

class Acladmin2 extends State<Acladmin> {
  late String mail, pass;
  bool secupass = true;
  //bool secupass = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  /*set email(_mail) {
    this.email=_mail;
  } set pass( _pass) {
    this.pass=_pass;
  }*/

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/images/background.png'),
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
                          elevation: 50.0,
                          //shadows
                          fillColor: Colors.white,
                          padding: EdgeInsets.all(30.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FadeAnimation(
                1.5,
                Container(
                  margin:
                      EdgeInsets.only(top: 10.0, left: 5, right: 5, bottom: 4),
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(35),
                      )),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.only(
                            top: 1, right: 11, left: 11, bottom: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                        ),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                // ignore: missing_return
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return 'Email obligatoire';
                                  }
                                },

                                onSaved: (input) => mail = input!,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                      color: Colors.brown, fontSize: 20),
                                  icon: Icon(
                                    Icons.mail,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  hintText: 'Entrer ton Email',
                                ),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
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
                                onPressed: signIn,
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  backgroundColor: Colors.indigo,
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

  Future<void> signIn() async {
    final formState = _formkey.currentState;

    if (formState!.validate()) {
//si cette condition est vrai on peut alors login
      formState.save();
      try {
        print(mail);
        User? user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: mail, password: pass))
            .user;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInL()));
      } catch (e) {
        print(e.toString());
      }
    }
  }

  String getM() => mail;
}
