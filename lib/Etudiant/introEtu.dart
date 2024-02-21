import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe2/models/etudiant/homeEtu.dart';
import 'package:pfe2/Etudiant/SignIn.dart';
import 'package:pfe2/models/etudiant/Etudiant.dart';
import 'package:pfe2/models/etudiant/ListEtudiant.dart';

class SignIn extends StatefulWidget {
String _apoge;
String _date;
SignIn(this._apoge,this._date);
  @override
  _SignInState createState() => _SignInState();

}
final studentReference = FirebaseDatabase.instance.reference().child('etudiants');
class _SignInState extends State<SignIn> {

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
            padding: const EdgeInsets.only(left:250.0,top: 20),
            child: Image(
              image: AssetImage('assets/images/wah.png'),
              fit: BoxFit.fitHeight,),
          ),
          title: Text(
            'Etudiant',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
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
                    child: new Text('Etudiant ${studentReference}'),
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
                        builder: (BuildContext context) => Login(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),


    );
  }
}
