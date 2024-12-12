// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/functions/firebaseFunc.dart';

class ArrayPage extends StatefulWidget {
  String dayName;
  ArrayPage({super.key, required this.dayName});

  @override
  State<ArrayPage> createState() => _ArrayPageState();
}

class _ArrayPageState extends State<ArrayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf0e0c5),
      appBar: AppBar(
        title: Text(
          widget.dayName,
          style: TextStyle(fontSize: 28),
        ),
        backgroundColor: Colors.red[300],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              color: Color(0xFFf0e0c5),
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("tasks")
                      .snapshots(),
                  builder: (context, taskSnapshot) {
                    if (taskSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      final taskDoc = taskSnapshot.data!.docs;
                      return ListView.builder(
                          itemCount: 17,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white.withOpacity(0.8),
                              elevation: 7,
                              child: ListTile(
                                title: Text(
                                  taskDoc[0]["umyc sie"],
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.black),
                                ),
                                subtitle: Text(
                                  taskDoc[0]["zjesc"],
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey[800]),
                                ),
                              ),
                            );
                          });
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
