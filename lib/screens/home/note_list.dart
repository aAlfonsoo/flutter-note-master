import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/noteController.dart';
import 'package:flutter_note/screens/home/chooseNote.dart';
import 'package:flutter_note/screens/home/show_note.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NoteList extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final NoteController noteController = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        itemCount: noteController.notes.length,
        staggeredTileBuilder: (index) =>
            StaggeredTile.fit(authController.axisCount.value),
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
                IconButton(
                    icon: Image.asset('assets/images/1.png'),
                    iconSize: 140,
                    onPressed: () {
              Get.to(() => ShowNote(
                  index: index, noteData: noteController.notes[index]));
            }),
          Text(
                        noteController.notes[index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Winkle-Regular',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]
                    );
          
        
        
        }));

  
  }
}