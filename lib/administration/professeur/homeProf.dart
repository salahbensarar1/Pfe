import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe2/models/etudiant/homeEtu.dart';
import 'package:pfe2/Etudiant/SignIn.dart';
import 'package:pfe2/models/etudiant/Etudiant.dart';
import 'package:pfe2/models/etudiant/ListEtudiant.dart';

import '../../Etudiant/introEtu.dart';
import '../../intro.dart';
import '../../models/cour/ListeCour.dart';
import '../../models/cour/screen_Ajout.dart';
import '../../models/professeur/ListProf.dart';

class SignInP extends StatefulWidget {
  String _User;
  String _pass;
  SignInP(this._User, this._pass);
  @override
  _SignInPState createState() => _SignInPState();
}

class _SignInPState extends State<SignInP> {
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
            'Professeur',
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
        /*AppBar(

          /*leading: Icon(Icons.menu,
            color: Colors.black45,
          ),*/
          backgroundColor: Colors.lime,
          title: Text('Professeur',style:
          TextStyle (
            color: Colors.white,
            fontSize: 30,

          ),
          ),

          actions: <Widget>[
           /* IconButton(
              icon : Icon(
                Icons.add,
                size: 30,
                color: Colors.black45,
              ),

              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder:
                        (context)=>ListProf(),
                ),
                );
              },

            ),*/
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26),
              child:
              Icon (Icons.search,
                size: 30,
                color :Colors.black45,
              ),

            ),




          ],
        ),*/
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
                    child: new Text('Professeur'),
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
                    'Cour',
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
                        builder: (BuildContext context) => Container(),
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
                        builder: (BuildContext context) => IntroScreen(),
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
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 105,
                width: 420,
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
                          MaterialPageRoute(builder: (context) => ListCour()),
                        );
                      },
                      child: Text(
                        'Gestion des Cours',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.add, color: Colors.black),
          onPressed: () => null,
        ),
      ),
    );
  }
}
