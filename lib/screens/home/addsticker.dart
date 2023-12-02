import 'package:flutter/material.dart';
import 'package:flutter_note/screens/home/add_note.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'stickerlist.dart';

void main() => runApp(AddSticker());

class AddSticker extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
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
        title: Text('STICKERS', style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Winkle-Regular'
                          ),
                          
      ),
      ),
            body: TabBarView(
              children: <Widget>[
                // GridView tab content Widget
                GridView.count(
                  // Items in row
                  crossAxisCount: 2,
                  // Vertical spacing between rows
                  mainAxisSpacing: 5.0,
                  // Horizontal spacing between columns
                  crossAxisSpacing: 5.0,
                  // Padding of GridView
                  padding: const EdgeInsets.all(5.0),
                  // The ratio between the width and height of items
                  childAspectRatio: 0.75,
                  // List of items widgets
                  children: items.map<Widget>((Sticker item) => _ItemGridCellWidget(item)).toList(),
                ),
                // ListView tab content Widget
                ListView.builder(itemCount: items.length, itemBuilder: (BuildContext context, int position) => _ItemListCellWidget(items[position]))
              ],
            )));
  }
}

class _ItemGridCellWidget extends StatelessWidget {
  final Sticker _item;

  _ItemGridCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: GestureDetector(
          onTap: () => _selectItem(context),
          child: Hero(
            key: Key(_item.image),
            tag: _item.image,
            child: Image.asset(
              _item.image,
            ),
          ),
        ));
  }
}

class _ItemListCellWidget extends StatelessWidget {
  final Sticker _item;

  _ItemListCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _selectItem(context),
//      isThreeLine: true,
      leading: Hero(
        key: Key(_item.image),
        tag: _item.image,
        child: Image.asset(
          _item.image,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}

class _ItemFullScreenWidget extends StatelessWidget {
  final Sticker _item;

  _ItemFullScreenWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
          child: Image.asset(
            _item.image,
          ),
        ),
    );
  }
}

List<Sticker> items = [
  Sticker(
    'assets/images/sticker1.png',
  ),
  Sticker(
    'assets/images/sticker2.png',
  ),
  Sticker(
    'assets/images/sticker3.png',
  ),
  Sticker(
    'assets/images/sticker4.png',
  ),
 Sticker(
    'assets/images/sticker5.png',
  ),
  Sticker(
    'assets/images/sticker6.png',
  ),
  Sticker(
    'assets/images/sticker7.png',
  ),
  Sticker(
    'assets/images/sticker8.png',
  ),
];
