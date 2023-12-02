import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/noteController.dart';
import 'package:flutter_note/group/group.dart';
import 'package:flutter_note/group/groupnote.dart';
import 'package:flutter_note/screens/home/add_note.dart';
import 'package:flutter_note/screens/home/chooseNote.dart';
import 'package:flutter_note/screens/home/mainNote.dart';
import 'package:flutter_note/screens/home/note.dart';
import 'package:flutter_note/screens/home/note_list.dart';
import 'package:flutter_note/screens/settings/account.dart';
import 'package:flutter_note/screens/settings/setting.dart';
import 'package:flutter_note/screens/widgets/custom_icon_btn.dart';
import 'package:get/get.dart';



class CreateGroup extends GetWidget<AuthController> {
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      appBar:AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.pink[300],
      actions: [
    IconButton(
      onPressed: () {Get.to(() => AppHome());},
      icon: Icon(Icons.close, color: Colors.black),
    ),
  ],
),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Column(
                children: [
                  Container(
                          child: Text(
                            "CREATE GROUP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Winkle-Regular'
                            ),
                          ),
                    ),
                     SizedBox(
                    height: 40,
                  ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                            "NAME",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Winkle-Regular'
                            ),
                          ),
                    ),
                    TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).buttonColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                            controller: authController.username,
                          ),
                           SizedBox(
                    height: 40,
                  ),
                           Container(
                      child: Text(
                            "ADD MEMBER",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Winkle-Regular'
                            ),
                          ),
                    ),
                    FlatButton(
                onPressed: () => {},
                child: Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(Icons.add),
                    Text("ENTER USERNAME", style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Winkle-Regular')),
                  ],
                )
                    ),
            
                  SizedBox(
                    height: 20,
                  ),
                  /*GetX<NoteController>(
                      init: Get.put<NoteController>(NoteController()),
                      builder: (NoteController noteController) {
                        if (noteController != null &&
                            noteController.notes != null) {
                          return NoteList();
                        } else {
                          return Text("No groups, create some ");
                        }
                      }),*/
                ],
              )),
        ),
     floatingActionButton: FloatingActionButton(
          tooltip: "Create Group",
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
          onPressed: () {
            Get.to(() => GroupNotePage());
          },
          child: Text('CREATE', style: TextStyle(fontFamily: 'Winkle-Regular', fontSize: 15 ), textAlign: TextAlign.center,),
              backgroundColor: Colors.pink[100],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
