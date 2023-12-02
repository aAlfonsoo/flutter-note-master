import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String firstname;
  String lastname;
  String birthdate;
  String username;
  String email;
  String password;
  String confirmpassword;

  UserModel({this.id, this.username, this.email, String firstname, String lastname, String birthdate, String password, String confirmpassword});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc['id'];
    firstname = doc['firstname'];
    lastname = doc['lastname'];
    username = doc['username'];
    birthdate = doc['birthdate'];
    email = doc['email'];
    password = doc['password'];
    confirmpassword = doc['confirmpassword'];
  }
}
