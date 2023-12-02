/* import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/noteController.dart';
import 'package:flutter_note/screens/widgets/custom_icon_btn.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'chooseNote.dart';
import 'note_list.dart';
import 'notepadClass.dart';
import 'add_note.dart';

void mainNote() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: mainMenu(
        noteList: [],
      ),
    ));
    class mainMenu extends StatefulWidget {
  List noteList;
  mainMenu({key, this.noteList}) : super(key: key);

  @override
  _mainMenuState createState() => _mainMenuState(noteList);
}

class _mainMenuState extends State<mainMenu> {
  List noteList = [];
  _mainMenuState(this.noteList);
  List<notePad> completeList = [];

  getData() {
    completeList.add(
      notePad(
        name: '${noteList[0].name}',
        icon: '${noteList[0].icon}',
      ),
    );
  }

 @override
  void initState() {
    if (noteList.isEmpty) {
    } else {
      getData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
@override
  Widget build(BuildContext context) {
    var authController;
    return Scaffold(
      appBar:AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.pink[300],
      actions: [
    IconButton(
      onPressed: () => Navigator.of(context).pop(),
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
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
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
                          return mainMenu();
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
            Get.to(() => chooseNote());
          },
          child: Icon(
            Icons.add,
            size: 30,
          )),
    );
  }
  */