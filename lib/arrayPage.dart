// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_app/functions/firebaseFunc.dart';

class ArrayPage extends StatefulWidget {
  String dayName;
  String taskName;
  ArrayPage({super.key, required this.taskName, required this.dayName});

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
                      return Center(
                          child: Container(
                              height: 100,
                              width: 100,
                              child: CircularProgressIndicator()));
                    } else {
                      final taskDoc = taskSnapshot.data!.docs;
                      return ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            final doc = taskDoc.firstWhere(
                                (document) => document.id == widget.dayName);
                            final data = doc.data() as Map<String, dynamic>;

                            if (data.isNotEmpty) {
                              return Column(
                                children: data.entries.map((entry) {
                                  return Slidable(
                                    endActionPane: ActionPane(
                                        motion: StretchMotion(),
                                        children: [
                                          SlidableAction(
                                            onPressed: (context) {
                                              setState(() {
                                                delete(
                                                    entry.key, widget.dayName);
                                              });
                                            },
                                            icon: Icons.delete_outline,
                                            backgroundColor: Colors.red,
                                          )
                                        ]),
                                    child: Card(
                                      color: Colors.white.withOpacity(0.8),
                                      elevation: 7,
                                      child: ListTile(
                                        title: Text(
                                          entry.value
                                              .toString(), // Wartość pola
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        subtitle: Text(
                                          entry.key, // Klucz pola
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            } else {
                              return Center(
                                child: Column(
                                  children: const [
                                    SizedBox(
                                      height: 200,
                                    ),
                                    Text("N O  T A S K S ",
                                        style: TextStyle(fontSize: 24)),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text("FOR TODAY ;)",
                                        style: TextStyle(fontSize: 20))
                                  ],
                                ),
                              );
                            }
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
