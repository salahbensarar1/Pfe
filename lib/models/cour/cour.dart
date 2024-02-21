//import 'dart:html';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class Cour {
  String? id; // Make it nullable
  String? title; // Make it nullable
  String? link; // Make it nullable
  String? categ; // Make it nullable

  Cour(this.id, this.title, this.link, this.categ);

  Cour.map(dynamic object) {
    this.id = object["id"]; //il va reserver une place dans base de donnes
    this.title = object["title"]; //il va reserver une place dans base de donnes
    this.link = object["link"];
    this.categ = object["categorie"];
  }

  Cour.fromSnapShot(DataSnapshot snapshot)
      :
        //pour lire les donnes de la base de données on fait le snap
        id = snapshot
            .key, //on considere cet id comme une clé primaire il va etre remlit automatiquement
        title = snapshot.value["title"],
        link = snapshot.value["link"],
        categ = snapshot.value["categorie"];

  toJson() {
    return {
      "CoursId": id,
      "Title": title,
      "Link": link,
      "Category": categ,
    };
  }
}
