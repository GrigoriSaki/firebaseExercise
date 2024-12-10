// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/functions/firebaseFunc.dart';
import 'package:my_app/utilities/chooseDayList.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  final dayName = TextEditingController();
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
          child: Text("N E W  P A G E "),
        ),
      ),
      body: Container(
        color: Color(0xFFf0e0c5),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChooseDayList(),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: dayName,
                  style: TextStyle(fontSize: 22),
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: "Day of week",
                      hintStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
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
                      hintStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
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
                      hintStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      addField(dayName.text, taskName.text, performerName.text);
                    },
                    child: Text(
                      ' ADD TASK ',
                      style: TextStyle(fontSize: 23),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
