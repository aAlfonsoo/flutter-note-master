import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/screens/settings/account.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';  
import 'package:table_calendar/table_calendar.dart';  
  
void maincal() => runApp(MyApp());  
  
class MyApp extends GetWidget<AuthController> {
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {  
    return MaterialApp(  
      debugShowCheckedModeBanner: false,
      theme: ThemeData(  
        primarySwatch: Colors.pink,  
      ),  
      home: HomeCalendarPage(),  
    );  
  }  
}  
  
class HomeCalendarPage extends StatefulWidget {  
  @override  
  _HomeCalendarPageState createState() => _HomeCalendarPageState();  
}  
  
class _HomeCalendarPageState extends State<HomeCalendarPage> {  
  CalendarController _controller;  
  
  @override  
  void initState() {  
    super.initState();  
    _controller = CalendarController();  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        automaticallyImplyLeading: false,
          backgroundColor: Colors.pink[300],
      actions: [
    IconButton(
      onPressed: () {Get.to(() =>Account());},
      icon: Icon(Icons.close, color: Colors.black),
    ),
  ],
   centerTitle: true,
        title: Text('MY CALENDAR', style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Winkle-Regular'
                          ),
                          
      ),
      ),
      backgroundColor: Colors.pink[200],
      body: SingleChildScrollView(  
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,  
          children: <Widget>[  
            TableCalendar(  
              initialCalendarFormat: CalendarFormat.month,  
              calendarStyle: CalendarStyle(  
                  todayColor: Colors.blue,  
                  selectedColor: Theme.of(context).primaryColor,  
                  todayStyle: TextStyle(  
                      fontWeight: FontWeight.bold,  
                      fontSize: 22.0,  
                      color: Colors.white)  
              ),  
              headerStyle: HeaderStyle(  
                centerHeaderTitle: true,  
                formatButtonDecoration: BoxDecoration(  
                  color: Colors.brown,  
                  borderRadius: BorderRadius.circular(22.0),  
                ),  
                formatButtonTextStyle: TextStyle(color: Colors.black),  
                formatButtonShowsNext: false,  
              ),  
              startingDayOfWeek: StartingDayOfWeek.monday,  
              onDaySelected: (date, events, _) {  
                print(date.toUtc());  
              },  
              builders: CalendarBuilders(  
                selectedDayBuilder: (context, date, events) => Container(  
                    margin: const EdgeInsets.all(5.0),  
                    alignment: Alignment.center,  
                    decoration: BoxDecoration(  
                        color: Theme.of(context).primaryColor,  
                        borderRadius: BorderRadius.circular(8.0)),  
                    child: Text(  
                      date.day.toString(),  
                      style: TextStyle(color: Colors.black),  
                    )),  
                todayDayBuilder: (context, date, events) => Container(  
                    margin: const EdgeInsets.all(5.0),  
                    alignment: Alignment.center,  
                    decoration: BoxDecoration(  
                        color: Colors.blue,  
                        borderRadius: BorderRadius.circular(8.0)),  
                    child: Text(  
                      date.day.toString(),  
                      style: TextStyle(color: Colors.black),  
                    )),  
              ),  
              calendarController: _controller,  
            )  
          ],  
        ),  
      ),  
    );  
  }  
}  