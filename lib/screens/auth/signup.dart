import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/userController.dart';
import 'package:get/get.dart';
import 'package:intl/number_symbols_data.dart';

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.pink[300],
      actions: [
    IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: Icon(Icons.close, color: Colors.black),
    ),
  ],
),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.pink[200],
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 100,
                horizontal: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "FIRST NAME",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).buttonColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                            controller: authController.firstname,
                             validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter a firstname!';
                              } else if (value.length <6) {
                                return "Please provide a username of 5+ character";
                              }else if (int.tryParse(value) != null) {
                            return 'Invalid firstname!';
                                  }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "LAST NAME",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).buttonColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                            controller: authController.lastname,
                             validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter a lastname!';
                              } else if (value.length < 6) {
                                return "Please provide a username of 5+ character";
                              }else if (int.tryParse(value) != null) {
                            return 'Invalid lastname!';
                                  }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "USERNAME",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).buttonColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                            controller: authController.username,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter a username!';
                              } else if (value.length < 6) {
                                return "Please provide a username of 5+ character";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "BIRTHDATE (MM/DD/YY)",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).buttonColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                            controller: authController.birthdate,
                             validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter a birthdate!';
                              } else if (value.length < 6) {
                                return "Please provide a username of 5+ character";
                              }
                              else if (int.tryParse(value) == null) {
                            return 'Invalid birthdate!';
                                  }
                              return null;
                            },
                          ),
                          TextFormField(
                            validator: (value) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)
                                  ? null
                                  : "Please Enter Correct Email";
                            },
                            decoration: InputDecoration(
                              hintText: "EMAIL",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).buttonColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                            controller: authController.email,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter a password!';
                              } else if (value.length < 6) {
                                return "Please provide password of 5+ character ";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "PASSWORD",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).buttonColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                            obscureText: true,
                            controller: authController.password,
                          ),
                          TextFormField(
                             validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter password to confirm!';
                              } else if (value.length < 6) {
                                return "Please provide a username of 5+ character";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "CONFIRM PASSWORD",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).buttonColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                            obscureText: true,
                            controller: authController.confirmpassword,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.pink[100],
                      ),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      minimumSize: MaterialStateProperty.all(
                        Size(
                          50,
                          30,
                        ),
                      ),
                    ),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Winkle-Regular'
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        authController.createUser();
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already a member? ",
                        style: TextStyle(
                          // color: Colors.grey.shade900,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Winkle-Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
