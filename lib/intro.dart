import 'package:flutter/material.dart';
import 'package:pfe2/administration/SignIn.dart';
import 'package:pfe2/Etudiant/SignIn.dart';
import 'package:pfe2/animate/animation.dart';

import 'administration/professeur/SignIn.dart';


class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor: Colors.white10,

        body:

        Center(



          child: Padding(


            padding: EdgeInsets.only(top: 0,left:10, right:10,bottom: 20 ),


            child: SingleChildScrollView(

              child: Column(


                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[


                  FadeAnimation(
                    1.0, // les Secondes d'animation
                     Image.asset('assets/images/pngegg.png',
                      height: 190,
                      //colorBlendMode: BlendMode.srcOut,

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:50.0),
                    child: Text('Se connecter en tant qu‘un ',style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 18.0
                    ),),
                  ),
                  //SizedBox(),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                  ),


                      Padding(
                        padding: EdgeInsets.only(left:8.0,right: 10),
                        child: Container(
                          child: Row(

                            children: [
                              SizedBox(
                                height: 70,
                                width: 130,
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
                                  ),
                                  child: MaterialButton(




                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SignIn()) ,
                                      );
                                    },
                                    shape: StadiumBorder(

                                    ),
                                    child: Text(
                                      'Professeur',

                                      style: TextStyle(
                                          color: Colors.white,
                                          backgroundColor: Colors.transparent,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                          fontFamily: 'Comfortaa'
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 110,
                                height: 170,

                              ),
                              SizedBox(
                                height: 70,
                                width: 130,
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
                                  ),
                                  child: MaterialButton(



                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Login()) ,
                                      );
                                    },
                                    shape: StadiumBorder(

                                    ),
                                    child: Text(
                                      'Etudiant',

                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                          fontFamily: 'Comfortaa'
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],


                          ),
                        ),
                      ),









                  SizedBox(
                    width: 150,
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
                      ),
                      margin: new EdgeInsets.only(top: 20,left: 20,right: 10),
                      child: SizedBox(
                        height: 70,

                        child: MaterialButton(



                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>Acladmin(),) ,
                            );
                          },
                          shape: StadiumBorder(

                          ),
                          child: Text(
                            'Admin',

                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                fontFamily: 'Comfortaa'
                            ),
                          ),
                        ),
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
}
