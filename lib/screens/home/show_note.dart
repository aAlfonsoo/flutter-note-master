import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/models/noteModel.dart';
import 'package:flutter_note/screens/home/addimage.dart';
import 'package:flutter_note/screens/home/addsticker.dart';
import 'package:flutter_note/screens/home/checkbox.dart';
import 'package:flutter_note/screens/home/home.dart';
import 'package:flutter_note/screens/home/linedpage.dart';
import 'package:flutter_note/screens/widgets/custom_icon_btn.dart';
import 'package:flutter_note/services/database.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'add_note.dart';

class ShowNote extends StatelessWidget {
  final NoteModel noteData;
  final int index;
  ShowNote({this.noteData, this.index});
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = noteData.title;
    bodyController.text = noteData.body;
    var formattedDate =
        DateFormat.yMMMd().format(noteData.creationDate.toDate());
    var time = DateFormat.jm().format(noteData.creationDate.toDate());
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
                      onPressed: () {
                        showDeleteDialog(context, noteData);
                      },
                      icon: Icon(
                        Icons.delete,color: Colors.black
                      ),
                    ),
      IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.close, color: Colors.black,),
      ),
]),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(
              16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text("$formattedDate at $time"),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: titleController,
                          maxLines: null,
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
                        TextFormField(
                          autofocus: true,
                          controller: bodyController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration.collapsed(
                            hintText: "Type something...",
                          ),
                          style: TextStyle(
                            fontSize: 20.0,
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
         bottomNavigationBar: BottomAppBar(
      color: Colors.pink[300],
      child: Row(
          children: [
            IconButton(icon: Icon(Icons.list_alt_outlined), onPressed: () {Get.to(() => Check());}),
            IconButton(icon: Icon(Icons.line_style_outlined), onPressed: () {Get.to(() => LinedPage());}),
            Spacer(),
            IconButton(icon: Icon(Icons.save_alt_outlined), onPressed: () { if (titleController.text.length == 0 &&
              bodyController.text.length == 0) {
            /*showEmptyTitleDialog(context);*/print("Notes is empty!");
          } else {
            Database().addNote(authController.user.uid, titleController.text,
                bodyController.text);
            Get.to(() => HomePage());
          }},),
          ],
        
                  ),
              )
  );
  }
}

void showDeleteDialog(BuildContext context, noteData) {
  final AuthController authController = Get.find<AuthController>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Text(
          "Delete Note?",
          style: Theme.of(context).textTheme.headline6,
        ),
        content: Text("Are you sure you want to delete this note?",
            style: Theme.of(context).textTheme.subtitle1),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Yes",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onPressed: () {
              Get.back();
              Database().delete(authController.user.uid, noteData.id);
              Get.back(closeOverlays: true);
            },
          ),
          TextButton(
            child: Text(
              "No",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showSameContentDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Text(
          "No change in content!",
          style: Theme.of(context).textTheme.headline6,
        ),
        content: Text("There is no change in content.",
            style: Theme.of(context).textTheme.subtitle1),
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
