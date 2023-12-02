import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_note/screens/home/note.dart';

class notePad {
  String title;
  String iconVal;

  notePad({this.title, this.iconVal});

  notePad.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    title = documentSnapshot['title'];
    iconVal = documentSnapshot["iconVal"];
  }

  notePad.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    iconVal = json["iconVal"];
  }
}