import 'package:flutter/material.dart';
import 'package:flutter_note/screens/home/add_note.dart';
import 'package:flutter_note/screens/home/addimage.dart';
import 'package:flutter_note/screens/home/addsticker.dart';
import 'package:flutter_note/screens/home/checkbox.dart';
import 'package:flutter_note/screens/home/home.dart';
import 'package:flutter_note/services/database.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
 runApp(LinedPage()); 
}

class LinedPage extends StatelessWidget {
  LinedPage({Key key}) : super(key: key);
   final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{const MyHomePage({Key key}) : super(key: key);

@override 
State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  var bodyController = TextEditingController();
  var titleController = TextEditingController();


/*@override
void initState() {
  _retrieveText().then((value) => {
    if (value != null){
      bodyController.text = value
    }
  });
  super.initState();
  
}*/
@override
Widget build(BuildContext context) {
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
        onPressed: () => {Get.to(() => AddNotePage())},
        icon: Icon(Icons.close, color: Colors.black),
      ),
  ],
         )),
    body: SafeArea(
      child: CustomPaint(
        foregroundPainter: PagePainter(),
        child: SizedBox.expand(
        child: Column(children:
                            [TextFormField(
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
            TextFormField(
            /*controller: bodyController,
            onChanged: (value){
              _saveText(value);
            },*/
            style: TextStyle(
              fontSize: 28,
              height: 1.43,
              fontWeight: FontWeight.w700
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: MediaQuery.of(context).size.width * 0.15),
              border: InputBorder.none),
          ),
                            ]
        ),
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
            IconButton(icon: Icon(Icons.save_alt_outlined), onPressed: () {  var bodyController;
  if (titleController.text.length == 0 &&
              bodyController.text.length == 0) {
            showEmptyTitleDialog(context);
          } else {
            var authController;
             Database().addNote(authController.user.uid, titleController.text,
                bodyController.text);
            Get.to(() => HomePage());
          }},),
          ],
        
                  ),
              ));
  

}
/*void _saveText(String text) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("NOTE_KEY", text);
}

 Future<String> _retrieveText() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("NOTE_KEY");
}*/
  }


class PagePainter extends CustomPainter{
  @override 
  void paint(Canvas canvas, Size size){
    final paintLine = Paint()
    ..color = Colors.black
    ..strokeWidth = 1.0;

    for (var x = 0.0; x <= size.height; x = x+40){
      canvas.drawLine(Offset(0, x), Offset(size.width, x), paintLine);
    }

  }
  @override 
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return false;
  }
}
