import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/noteController.dart';
import 'package:flutter_note/group/creategroup.dart';
import 'package:flutter_note/group/grouplist.dart';
import 'package:flutter_note/group/joingroup.dart';
import 'package:flutter_note/screens/home/add_note.dart';
import 'package:flutter_note/screens/home/note_list.dart';
import 'package:flutter_note/screens/settings/account.dart';
import 'package:flutter_note/screens/settings/setting.dart';
import 'package:flutter_note/screens/widgets/custom_icon_btn.dart';
import 'package:get/get.dart';


class AppHome extends GetWidget<AuthController> {
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
                  
                        /*CustomIconBtn(
                          color: Theme.of(context).backgroundColor,
                          onPressed: () {
                            authController.axisCount.value =
                                authController.axisCount.value == 2 ? 4 : 2;
                          },
                          icon: Icon(authController.axisCount.value == 2
                              ? Icons.list
                              : Icons.grid_on),
                        ),*/
                        Container(
                          child: Text(
                            "MY GROUPS",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Winkle-Regular'
                            ),
                          ),
                    ),
                      
                        /*CustomIconBtn(
                          color: Theme.of(context).backgroundColor,
                          onPressed: () {
                            Get.to(() => Setting());
                          },
                          icon: Icon(
                            Icons.settings,
                          ),
                        ),*/
                  SizedBox(
                    height: 20,
                  ),
                  GetX<NoteController>(
                      init: Get.put<NoteController>(NoteController()),
                      builder: (NoteController noteController) {
                        if (noteController != null &&
                            noteController.notes != null) {
                          return GroupList();
                        } else {
                          return Text("No notes, create some ");
                        }
                      }),
                ],
              )),
        ),
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
       floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
      child: Align(
        alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              heroTag: 'Create Group',
              onPressed: () {Get.to(() => CreateGroup());},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('Create Group', style: TextStyle(fontFamily: 'Winkle-Regular', fontSize: 15 ), textAlign: TextAlign.center,),
              backgroundColor: Colors.pink[100],
            ),
      ),
          ),
          Positioned.fill(
      child: Align(
        alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: 'Join Group',
              onPressed: () {Get.to(() => JoinGroup());},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('Join Group', style: TextStyle(fontFamily: 'Winkle-Regular', fontSize: 15 ), textAlign: TextAlign.center,),
              backgroundColor: Colors.pink[100],
            ), 
          ),
          ),

        ],
    )
    );
  }
}