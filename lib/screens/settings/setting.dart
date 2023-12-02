import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/screens/settings/account.dart';
import 'package:flutter_note/screens/settings/dark_mode.dart';
import 'package:flutter_note/screens/settings/widgets/list_tile.dart';
import 'package:flutter_note/screens/widgets/custom_icon_btn.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.pink[200],
         appBar:AppBar(
          title: Center(child: Text("SETTINGS", style: TextStyle(fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Winkle-Regular'),)),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.pink[300],
        actions: [
      IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.close, color: Colors.black,),
      ),
  ],
),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTileSetting(
                  onTap: () {
                    Get.to(() => Account());
                  },
                  title: "Account",
                  iconData: Icons.person,
                  subtitle: null,
                ),
                ListTileSetting(
                  onTap: () {
                    Get.to(() => Account());
                  },
                  title: "Privacy",
                  iconData: Icons.lock,
                  subtitle: null,
                ),
                ListTileSetting(
                  onTap: () {
                    Get.to(() => Account());
                  },
                  title: "Security",
                  iconData: Icons.security,
                  subtitle: null,
                ),
                ListTileSetting(
                  onTap: () {
                    Get.to(() => DarkMode());
                  },
                  title: "Dark Mode",
                  iconData: Icons.nights_stay,
                  subtitle: null,
                ),
                ListTileSetting(
                  onTap: () {
                    showSignOutDialog(context);
                  },
                  title: "Logout",
                  iconData: Icons.power_settings_new_outlined,
                  subtitle: null,
                  ),
              ],
            ),
          ),
        ),
    );
  }
}
void showSignOutDialog(BuildContext context) async {
  final AuthController authController = Get.find<AuthController>();
  print("in dialog ");
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(20),
        actionsPadding: EdgeInsets.only(right: 60),
        backgroundColor: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        title: Text(
          "Are you sure you want to log out?",
          style: TextStyle(
            color: Theme.of(context).buttonColor,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        content: Text(
          'Your notes are already saved so when logging back your noteswill be there.',
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text("Log Out",
                style: TextStyle(
                  color: Theme.of(context).backgroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            onPressed: () {
              Get.back();
              authController.signout();
              Get.close(2);
            },
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).buttonColor,
            ),
          ),
          TextButton(
            child: Text("Cancel",
                style: TextStyle(
                  color: Theme.of(context).buttonColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


