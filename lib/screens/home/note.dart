import 'package:flutter/material.dart';
import 'home.dart';
import 'notepadClass.dart';
import 'chooseNote.dart';

class note extends StatefulWidget {
  const note({Key key}) : super(key: key);

  @override
  State<note> createState() => _noteState();
}

class _noteState extends State<note> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 196, 207),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 227, 196, 207),
        title: Text(
          'NOTEBOOK',
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'Handwriting',
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: TextField(
        decoration: InputDecoration(
            border: InputBorder.none, hintText: 'Typing Something'),
        textAlign: TextAlign.center,
        maxLines: null,
        style: TextStyle(fontSize: 15, fontFamily: 'Handwriting'),
      ),
    );
  }
}
