// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/functions/firebaseFunc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  bool isLogin = false;
  String email = '';
  String password = '';
  String userName = '';
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf0e0c5),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Center(
          child: Text(
            "ATTEMPT",
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Colors.red.shade300,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    !isLogin
                        ? TextFormField(
                            key: ValueKey("name"),
                            validator: (value) {
                              if (value.toString().length <= 3) {
                                return "User name is too short";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (newValue) {
                              userName = newValue!;
                            },
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                hintText: "Enter the name",
                                hintStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      key: ValueKey("email"),
                      validator: (value) {
                        if (!(value.toString().contains("@"))) {
                          return "Your email have to contains '@' sign";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        email = newValue!;
                      },
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Enter the email",
                          hintStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      key: ValueKey("password"),
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value.toString().length <= 6) {
                          return "Your password is too weak!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        password = newValue!;
                      },
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Enter the password",
                          hintStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    !isLogin
                        ? TextFormField(
                            key: ValueKey("repeated password"),
                            obscureText: true,
                            validator: (value) {
                              if (value != passwordController.text) {
                                return "Passwords are different ";
                              } else {
                                return null;
                              }
                            },
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                hintText: "Repeat the password",
                                hintStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(16)),
                      child: !isLogin
                          ? TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  signUp(email, password, context);
                                }
                              },
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Colors.red.shade300)),
                              child: Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            )
                          : TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  signIn(email, password, context);
                                }
                              },
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Colors.red.shade300)),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    !isLogin
                        ? TextButton(
                            onPressed: () {
                              setState(() {
                                isLogin = true;
                              });
                            },
                            child: Text(
                              "Already signup? Login",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[900]),
                            ))
                        : TextButton(
                            onPressed: () {
                              setState(() {
                                isLogin = false;
                              });
                            },
                            child: Text(
                              "You don't have an account? \n             Register now",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[900]),
                            ))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
