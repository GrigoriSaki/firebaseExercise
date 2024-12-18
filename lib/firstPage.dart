// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/arrayPage.dart';
import 'package:my_app/functions/firebaseFunc.dart';
import 'package:my_app/utilities/chooseDayList.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String dayName = "Monday";

  final performerName = TextEditingController();

  final taskName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf0e0c5),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                signOut();
              },
              icon: Icon(
                Icons.logout,
                size: 32,
                color: Colors.grey[900],
              ))
        ],
        backgroundColor: Colors.red[300],
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("M A I N  P A G E "),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFf0e0c5),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Choose the day: ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800]),
                      ),
                      ChooseDayList(
                        oneDay: (day) {
                          setState(() {
                            dayName = day;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: performerName,
                    style: TextStyle(fontSize: 22),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Name of performer",
                        hintStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: taskName,
                    style: TextStyle(fontSize: 22),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Name of task",
                        hintStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        addField(dayName, taskName.text, performerName.text);

                        taskName.clear();
                        performerName.clear();
                      },
                      child: Text(
                        ' ADD TASK ',
                        style: TextStyle(fontSize: 23),
                      )),
                  SizedBox(
                    height: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("See tasks array",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w400)),
                      SizedBox(
                        width: 25,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return ArrayPage(
                                dayName: dayName,
                                taskName: taskName.text,
                              );
                            }));
                          },
                          icon: Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 60,
                            color: Colors.red[400],
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
