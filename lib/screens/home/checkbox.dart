import 'package:flutter/material.dart';
import 'package:flutter_note/screens/home/addimage.dart';
import 'package:flutter_note/screens/home/addsticker.dart';
import 'package:flutter_note/screens/home/home.dart';
import 'package:flutter_note/screens/home/linedpage.dart';
import 'package:flutter_note/services/database.dart';
import 'package:get/get.dart';

void main() => runApp(Check());

class Check extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner: false, home: TodoList());
   
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<String> _todoList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
            automaticallyImplyLeading: false,
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
        icon: Icon(Icons.close, color: Colors.black,),
      ),
        ]
        ),
      body: ListView(children: _getItems()),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pink[100],
          onPressed: () => _displayDialog(context),
          tooltip: 'Add Item',
          icon: Icon(Icons.add, color: Colors.black,),
           label: Text('ADD', style: TextStyle(color: Colors.black),),),  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          bottomNavigationBar: BottomAppBar(
      color: Colors.pink[300],
      child: Row(
          children: [
            IconButton(icon: Icon(Icons.list_alt_outlined), onPressed: () {Get.to(() => Check());}),
            IconButton(icon: Icon(Icons.line_style_outlined), onPressed: () {Get.to(() => LinedPage());}),
            Spacer(),
            IconButton(icon: Icon(Icons.save_alt_outlined), onPressed: () {
 var titleController;
 var bodyController;
 if (titleController.text.length == 0 &&
              bodyController.text.length == 0) {
            /*showEmptyTitleDialog(context);*/print("Notes is empty!");
          } else {
             var authController;
             Database().addNote(authController.user.uid, titleController.text,
                bodyController.text);
            Get.to(() => HomePage());
          }},),
          ],
        
                  ),
              )
    );
  }

  void _addTodoItem(String title) {
    // Wrapping it inside a set state will notify
    // the app that the state has changed
    setState(() {
      _todoList.add(title);
    });
    _textFieldController.clear();
  }

  // Generate list of item widgets
  Widget _buildTodoItem(String title) {
    return ListTile(title: Text(title));
  }

  // Generate a single item widget
  Future<AlertDialog> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.pink[100],
            title: const Text('Add a task to your list', style: TextStyle(color: Colors.black, fontFamily: 'Winkle-Regular'),),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('ADD', style: TextStyle(color: Colors.black, fontFamily: 'Winkle-Regular'),),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                },
              ),
              FlatButton(
                child: const Text('CANCEL', style: TextStyle(color: Colors.black, fontFamily: 'Winkle-Regular'),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _todoList) {
      _todoWidgets.add(_buildTodoItem(title));
      print(IconButton(icon: Icon(Icons.check_box_outline_blank_rounded), onPressed: () {}));
    }
    return _todoWidgets;
  }
}