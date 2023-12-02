import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/group/creategroup.dart';
import 'package:flutter_note/group/group.dart';
import 'package:flutter_note/group/joingroup.dart';
import 'package:flutter_note/screens/home/add_note.dart';
import 'package:flutter_note/screens/home/show_note.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class AddImage extends StatelessWidget {
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      backgroundColor: Colors.pink[200],
      appBar: AppBar(  
        automaticallyImplyLeading: false,
          backgroundColor: Colors.pink[300],
      actions: [
   IconButton(
      onPressed: () {Get.to(() => AddNotePage());},
      icon: Icon(Icons.close, color: Colors.black),
    ),
  ],
   centerTitle: true,
        title: Text('IMAGE', style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Winkle-Regular'
                          ),
                          
      ),
      ),
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Column(
                children: [
                  Center(
                    child: Container(
                            child: Text(
                              "CHOOSE:",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Winkle-Regular'
                              ),
                            ),
                      ),
                  ),
                     SizedBox(
                    height: 40,
                  ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            color: Colors.pink[100],
                    onPressed: () => {},
                    child: Column( // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.upload_file_rounded),
                        Text("UPLOAD FILE", style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Winkle-Regular')),
                      ],
                    )
                        ),
        ),
                       SizedBox(
                    height: 40,
                  ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          color: Colors.pink[100],
                  onPressed: () => {},
                  child: Column( // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                        Icon(Icons.camera_alt_rounded),
                        Text("USE CAMERA", style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Winkle-Regular'),
                                  ),
                    ],
                  )
                        ),
                      ),
      ]
          )
      ),
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
       floatingActionButton: Column(
         children: [
           Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
      child: Align(
            alignment: Alignment.centerLeft,
                child: FloatingActionButton(
                  heroTag: 'UPLOAD FILE',
                  onPressed: () {Get.to(() => CreateGroup());},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('UPLOAD FILE', style: TextStyle(fontFamily: 'Winkle-Regular', fontSize: 15 ), textAlign: TextAlign.center,),
                  backgroundColor: Colors.pink[100],
                ),
      ),
              ),
              Positioned.fill(
      child: Align(
            alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  heroTag: 'USE CAMERA',
                  onPressed: () {Get.to(() => JoinGroup());},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('USE CAMERA', style: TextStyle(fontFamily: 'Winkle-Regular', fontSize: 15 ), textAlign: TextAlign.center,),
                  backgroundColor: Colors.pink[100],
                ), 
              ),
              ),

            ],
    ),
         ],
       )
    );
  }
}