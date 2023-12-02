import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/noteController.dart';
import 'package:flutter_note/controllers/userController.dart';
import 'package:flutter_note/models/noteModel.dart';
import 'package:flutter_note/screens/home/add_note.dart';
import 'package:flutter_note/screens/home/home.dart';
import 'package:flutter_note/screens/home/show_note.dart';
import 'package:flutter_note/services/database.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'mainNote.dart';
import 'notepadClass.dart';

class ChooseNote extends GetWidget<AuthController> {
  final AuthController authController = Get.find<AuthController>();
  final NoteController noteController = Get.find<NoteController>();

  /*chooseNote(List<String> iconVal);*/

  set iconVal(String iconVal) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
         appBar:AppBar(
          title: Center(child: Text("CHOOSE A NOTEBOOK", style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold, fontFamily: 'Winkle-Regular' ),)),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.pink[300],
        actions: [
      IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.close, color: Colors.black,),
      ),
  ],
),
      body: GridView.count(
        crossAxisCount: 1,
                children: [
          IconButton(
            icon: Image.asset('assets/images/1.png'),
            iconSize: 50,
            onPressed: () {
              var iconVal = 'assets/images/1.png';
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChooseName(iconVal: iconVal)));
            },
          ),
          IconButton(
            icon: Image.asset('assets/images/2.png'),
            iconSize: 50,
            onPressed: () {
              var iconVal = 'assets/images/2.png';
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChooseName(iconVal: iconVal)));
            },
          ),
          IconButton(
            icon: Image.asset('assets/images/3.png'),
            iconSize: 50,
            onPressed: () {
            var iconVal = 'assets/images/3.png';
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChooseName(iconVal: iconVal)));
            },
          ),
          IconButton(
            icon: Image.asset('assets/images/4.png'),
            iconSize: 50,
            onPressed: () {
              var iconVal = 'assets/images/4.png';
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChooseName(iconVal: iconVal)));
            },
          )
        ],
        ),
      );
  }
}

// ignore: must_be_immutable
class ChooseName extends StatefulWidget {
  String iconVal;
  ChooseName({key, this.iconVal}) : super(key: key);

  @override
  _ChooseNameState createState() => _ChooseNameState(iconVal);
}



class _ChooseNameState extends State<ChooseName> {
  String iconVal;
  _ChooseNameState(this.iconVal);
  List<notePad> noteList = [];
  void makeRoutePage({BuildContext context, Widget pageRef}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => pageRef),
        (Route<dynamic> route) => false);
  }

  /*final TextEditingController titleController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  final UserController userController = Get.find<UserController>();
  final AuthController authController = Get.find<AuthController>();*/

  TextEditingController nameController = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pink[200],
          title: Text(
            'NEW NOTEBOOK',
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'Winkle-Regular',
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              textColor: Colors.black,
              onPressed: () {
                setState(() {
                  notePad(title: nameController.text, iconVal: '$iconVal');
                });
                makeRoutePage(
                    context: context, pageRef: AddNotePage());
              },
              child: Text("✔", style: TextStyle(fontSize: 20, color: Colors.black)),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ],
    ),
    body: Column(
          children: [
            Image.asset('$iconVal'),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter Notebook Name'),
              textAlign: TextAlign.center,
              maxLength: 10,
              style: TextStyle(fontSize: 25, fontFamily: 'Winkle-Regular'),
            )
          ],
        ));
  }
}

