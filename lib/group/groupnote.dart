import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/userController.dart';
import 'package:flutter_note/group/group.dart';
import 'package:flutter_note/screens/home/addimage.dart';
import 'package:flutter_note/screens/home/addsticker.dart';
import 'package:flutter_note/screens/home/checkbox.dart';
import 'package:flutter_note/screens/home/home.dart';
import 'package:flutter_note/screens/home/linedpage.dart';
import 'package:flutter_note/screens/widgets/custom_icon_btn.dart';
import 'package:flutter_note/services/database.dart';
import 'package:get/get.dart';


class GroupNotePage extends StatelessWidget {
  final UserController userController = Get.find<UserController>();
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  /*QuillController _controller = QuillController.basic();*/
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
         appBar:PreferredSize( //wrap with PreferredSize
                preferredSize: Size.fromHeight(50), //height of appbar
                child:AppBar(
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
        onPressed: () {Get.to(() => AppHome());},
        icon: Icon(Icons.close, color: Colors.black),
      ),
  ],
         )),
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
                    /*Padding(
                      padding: const EdgeInsets.only(top:38.0),
                      child: QuillToolbar.basic(controller: _controller),
                    ),
                    Expanded(child: 
                    Container(child: QuillEditor.basic(controller: _controller, readOnly: false),)),*/
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
                    TextFormField(
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
                    ),
                  ],
                ),
              ),
            ),
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
            IconButton(icon: Icon(Icons.people), onPressed: () {Get.to(() => LinedPage());}),
            IconButton(icon: Icon(Icons.save_alt_outlined), onPressed: () {
 if (titleController.text.length == 0 &&
              bodyController.text.length == 0) {
            /*showEmptyTitleDialog(context);*/print("Notes is empty!");
          } else {
             Database().addNote(authController.user.uid, titleController.text,
                bodyController.text);
            Get.to(() => AppHome());
          }},),
          ],
        
                  ),
              ));
  }
}

/*void showEmptyTitleDialog(BuildContext context) {
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
        title: Text("Notes is empty!",
          style: Theme.of(context).textTheme.headline6,),
        
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
}*/
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
