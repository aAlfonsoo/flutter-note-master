import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/noteController.dart';
import 'package:flutter_note/screens/home/add_note.dart';
import 'package:flutter_note/screens/home/chooseNote.dart';
import 'package:flutter_note/screens/home/mainNote.dart';
import 'package:flutter_note/screens/home/note.dart';
import 'package:flutter_note/screens/home/note_list.dart';
import 'package:flutter_note/screens/settings/account.dart';
import 'package:flutter_note/screens/settings/setting.dart';
import 'package:flutter_note/screens/widgets/custom_icon_btn.dart';
import 'package:get/get.dart';
import 'notepadClass.dart';
import 'note_list.dart';


class HomePage extends GetWidget<AuthController> {
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
      onPressed: () {Get.to(() => Account());},
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
          child: Obx(() => Column(
                children: [
                  Container(
                          child: Text(
                            "MY NOTEBOOKS",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Winkle-Regular'
                            ),
                          ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  GetX<NoteController>(
                      init: Get.put<NoteController>(NoteController()),
                      builder: (NoteController noteController) {
                        if (noteController != null &&
                            noteController.notes != null) {
                          return NoteList();
                        } else {
                          return Text("No notes, create some ");
                        }
                      }),
                ],
              )),
        ),
      ),
     floatingActionButton: FloatingActionButton(
          tooltip: "Add Note",
          onPressed: () {
            Get.to(() => ChooseNote());
          },
          child: Icon(
            Icons.add,
            size: 30,
          ),
          backgroundColor: Colors.pink[100],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
