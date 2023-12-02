// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/userController.dart';
import 'package:flutter_note/screens/home/addimage.dart';
import 'package:flutter_note/screens/home/checkbox.dart';
import 'package:flutter_note/screens/home/home.dart';
import 'package:flutter_note/screens/home/linedpage.dart';
import 'package:flutter_note/services/database.dart';
import 'package:get/get.dart';

import 'addsticker.dart';

class AddNotePage extends StatelessWidget {
  final UserController userController = Get.find<UserController>();
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
         appBar:AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.pink[300],
        actions: <Widget> [
              Row(
                children: [
    FlatButton(
      minWidth: 5,
       padding: EdgeInsets.all(0),
      onPressed: () {Get.to(() => AddImage());},
      child: Icon(Icons.format_bold_rounded),  
      shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
    ),
    FlatButton(
      minWidth: 5,
       padding: EdgeInsets.all(0),
      onPressed: () {Get.to(() => AddImage());},
      child: Icon(Icons.format_italic_rounded), 
      shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
    ),
    FlatButton(
      minWidth: 5,
       padding: EdgeInsets.all(0),
      onPressed: () {Get.to(() => AddImage());},
      child: Icon(Icons.format_underline_rounded), 
      shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
    ),
        ]),
                  FlatButton(
                    minWidth: 5,
                     padding: EdgeInsets.all(5),
      onPressed: () {Get.to(() => AddImage());},
      child: Text("ADD IMAGE", style: TextStyle(color: Colors.black, fontFamily: 'Winkle-Regular'),), 
      shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
    ),
        FlatButton(
          minWidth: 5,
           padding: EdgeInsets.all(5),
              onPressed: () {Get.to(() => AddSticker());},
              child: Text("ADD STICKERS", style: TextStyle(color: Colors.black, fontFamily: 'Winkle-Regular'),), 
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        ),
      IconButton(
        onPressed: () {Get.to(() => HomePage());},
        icon: Icon(Icons.close, color: Colors.black),
      ),
        ]
         ),
      body: SafeArea(
        child: Container(
          height: size.height,
          padding: EdgeInsets.all(
            16.0,
          ),
          child: Column(children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      maxLines: null,
                      autofocus: true,
                      controller: titleController,
                      keyboardType: TextInputType.multiline,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration.collapsed(
                        hintText: "Title",
                      ),
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    /*TextFormField(
                      controller: bodyController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration.collapsed(
                        hintText: "Type something...",
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),*/
                    Container(child: Text('Check Functionality', style: TextStyle(fontSize: 20.0), textAlign: TextAlign.left,), alignment: Alignment.topLeft,
                    ),
                    IconButton(
                    icon: Image.asset('assets/images/sticker1.png'),
                    iconSize: 140,
                    onPressed: () {})
        
                  ],
                ),
            )),
          ]),
        ),
      ),
       bottomNavigationBar: BottomAppBar(
      color: Colors.pink[300],
      child: Row(
          children: [
            IconButton(icon: Icon(Icons.list_alt_outlined), onPressed: () {Get.to(() => Check());}),
            IconButton(icon: Icon(Icons.line_style_outlined), onPressed: () {Get.to(() => LinedPage());}),
            Spacer(),
            IconButton(icon: Icon(Icons.save_alt_outlined), onPressed: () {
if (titleController.text.length == 0 &&
              bodyController.text.length == 0) {
           showEmptyTitleDialog(context);
          } else {
            Database().addNote(authController.user.uid, titleController.text,
                bodyController.text);
            Get.back();
          }
        },),
          ],
        
                  ),
              ));
  }
}

void showEmptyTitleDialog(BuildContext context) {
  print("in dialog ");
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        title: Text(
          "Notes is empty!",
          style: Theme.of(context).textTheme.headline6,
        ),
        content: Text(
          'The content of the note cannot be empty to be saved.',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Okay",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    },
  );
}
/*class CheckboxWidget extends StatefulWidget {
  final Function(bool) callback;

  const CheckboxWidget({key,this.callback}) : super(key: key);

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool _checkbox = true;

  @override
  Widget build(BuildContext context) {
    return   CheckboxListTile(
      title: const Text('Remember Password', style: TextStyle(color: Colors.grey),),
      value: _checkbox,
      onChanged: (value) {
        widget.callback(value);
        setState(() => _checkbox = !_checkbox);},
    );
  }
}*/
