import 'package:flutter/material.dart';
import 'package:flutter_note/calendar/calendar.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/userController.dart';
import 'package:flutter_note/group/group.dart';
import 'package:flutter_note/models/user.dart';
import 'package:flutter_note/screens/home/home.dart';
import 'package:flutter_note/screens/settings/setting.dart';
import 'package:flutter_note/screens/widgets/custom_icon_btn.dart';
import 'package:get/get.dart';

class Account extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.pink[300],
),
      backgroundColor: Colors.pink[200],
      body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text("MY PROFILE",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Winkle-Regular',
                          ),
                          textAlign: TextAlign.center),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                       child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius:BorderRadius.circular(100)
                            ),
                            child: Icon(
                                Icons.add_a_photo,
                            color: Colors.black,
                               ),
                       ),
                                ),
                    height: MediaQuery.of(context).size.width - 270,
                    width: MediaQuery.of(context).size.width - 270,
                    decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/profile.png'
              ),
              fit: BoxFit.cover
            ),
      ),
    ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "groupsix",
                            style: TextStyle(
                              color: Get.isDarkMode ? Colors.black : Colors.white,
                              fontSize: 30,
                              fontFamily: 'Winkle-Regular'
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ListTile(
                         onTap: () {
                      Get.to(() => HomePage());
                    },
                     leading: Icon(Icons.auto_awesome_rounded),
                     title: Text('NOTEBOOKS', style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Winkle-Regular'
                            ),),
                         ),
                  ),
                     ListTile(
                      onTap: () {
                    Get.to(() => AppHome());
                  },
                      leading: Icon(Icons.auto_awesome_rounded),
                      title: Text('GROUPS', style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Winkle-Regular'
                          ),),
                  ),
                ListTile(
                  onTap: () {
                    Get.to(() =>MyApp());
                  },
                leading: Icon(Icons.auto_awesome_rounded),
                title: Text('CALENDAR', style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Winkle-Regular'
                          ),),
    ),
    ListTile(
      onTap: () {
                    Get.to(() =>Setting());
                  },
                leading: Icon(Icons.auto_awesome_rounded),
                title: Text('SETTINGS', style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Winkle-Regular'
                          ),),
    ),
  ],
),
          ),
          ),
        );
  }
}
Widget buildName(UserModel user) => Column(
        children: [
          Text(
            user.firstname,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );


