// ignore_for_file: avoid_print, prefer_const_constructors, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/firstPage.dart';

signUp(String email, String password, context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Registered succesfully !!!")));
    createData();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

signIn(String email, String password, context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Wrong email or password !!!")));
    }
  }
}

signOut() async {
  await FirebaseAuth.instance.signOut();
}

createData() async {
  List<String> days = [
    "Monday",
    "Tuesday",
    "Wendesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  for (var day in days) {
    await FirebaseFirestore.instance.collection("tasks").doc(day).set({});
  }
  print("Data is created");
}

addField(String dayOfWeek, String taskName, String perfName) async {
  await FirebaseFirestore.instance
      .collection("tasks")
      .doc(dayOfWeek)
      .update({taskName: perfName});
}
