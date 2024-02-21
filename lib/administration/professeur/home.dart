import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe2/administration/SignIn.dart';
import 'package:pfe2/administration/professeur/delegateSearche.dart';
import 'package:pfe2/animate/animation.dart';
import 'package:pfe2/models/professeur/ListProf.dart';
import 'package:pfe2/models/etudiant/ListEtudiant.dart';

import '../../models/professeur/ListProf.dart';

class SignInL extends StatefulWidget {
  @override
  _SignInLState createState() => _SignInLState();
}

class _SignInLState extends State<SignInL> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
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
            'Administration',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          /*actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ListEtudiant()),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: TheSearch(),
                    query: "Nom ou Prénom",
                  );
                },
              ),
            ),
          ],*/
        ),
        drawer: new Drawer(
          child: Container(
            //color: Colors.blueGrey,
            width: double.infinity,
            height: double.infinity,

            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background3.png"),
                    fit: BoxFit.cover)),
            child: ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(.8)),
                  accountName: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 8.0, left: 13.0),
                    child: new Text('Admin'),
                  ),
                  accountEmail: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 8.0, left: 15.0),
                    //child: new Text('${getUserRecent()}'),
                  ),
                  currentAccountPicture: new CircleAvatar(
                    backgroundImage: new NetworkImage(
                        'https://i.pinimg.com/736x/21/20/b0/2120b058cb9946e36306778243eadae5.jpg'),
                  ),
                ),
                new ListTile(
                  title: new Text(
                    'Administration',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new ListEtudiant(),
                      ),
                    );
                  },
                ),
                new ListTile(
                  title: new Text(
                    'Deconnexion',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (BuildContext context) => Acladmin(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 75,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150.0, left: 25),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.centerLeft,
                        stops: [
                          0.3,
                          0.8,
                        ],
                        colors: [
                          Colors.orange,
                          Colors.purpleAccent,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          color: Colors.white,
                          blurRadius: 16.0,
                        ),
                        BoxShadow(
                          offset: Offset(0, 0),
                          color: Colors.white,
                          blurRadius: 16.0,
                        ),
                        BoxShadow(
                          offset: Offset(0, 0),
                          color: Colors.white,
                          blurRadius: 18.0,
                        ),
                      ]),
                  child: SizedBox(
                    width: 210,
                    child: new MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListEtudiant()),
                        );
                      },
                      child: Text(
                        'Gestion des etudiants',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                //width: 100,
              ),
              Center(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 113),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.centerLeft,
                                  stops: [
                                    0.3,
                                    0.8,
                                  ],
                                  colors: [
                                    Colors.orange,
                                    Colors.purpleAccent,
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    color: Colors.white,
                                    blurRadius: 16.0,
                                  ),
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    color: Colors.white70,
                                    blurRadius: 25.0,
                                  ),
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    color: Colors.white,
                                    blurRadius: 17.0,
                                  ),
                                ]),
                            child: SizedBox(
                              width: 210,
                              child: new RawMaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListProf()),
                                  );
                                },
                                child: Text(
                                  'Gestion des Professeurs',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                      fontSize: 18.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getUserRecent() async {
    final User? user = await auth.currentUser;
    String uid = user!.uid.toString();
    final String uemail = user.email.toString();

    print(uemail);
    return uemail;
  }
}
