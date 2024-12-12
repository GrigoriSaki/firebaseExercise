import 'package:flutter/material.dart';

class ChooseDayList extends StatefulWidget {
  final Function(String) oneDay;
  ChooseDayList({super.key, required this.oneDay});

  @override
  State<ChooseDayList> createState() => _ChooseDayListState();
}

class _ChooseDayListState extends State<ChooseDayList> {
  String dropDownValue = "Monday";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        elevation: 50,
        iconSize: 32,
        dropdownColor: Colors.red[200],
        borderRadius: BorderRadius.circular(8),
        value: dropDownValue,
        onChanged: (String? newValue) {
          setState(() {
            dropDownValue = newValue!;
            widget.oneDay(dropDownValue);
          });
        },
        items: const [
          DropdownMenuItem(
              value: "Monday",
              child: Text(
                "Monday",
                style: TextStyle(fontSize: 18),
              )),
          DropdownMenuItem(
              value: "Tuesday",
              child: Text("Tuesday", style: TextStyle(fontSize: 18))),
          DropdownMenuItem(
              value: "Wenesday",
              child: Text("Wenesday", style: TextStyle(fontSize: 18))),
          DropdownMenuItem(
              value: "Thursday",
              child: Text("Thursday", style: TextStyle(fontSize: 18))),
          DropdownMenuItem(
              value: "Friday",
              child: Text("Friday", style: TextStyle(fontSize: 18))),
          DropdownMenuItem(
              value: "Saurday",
              child: Text("Saurday", style: TextStyle(fontSize: 18))),
          DropdownMenuItem(
              value: "Sunday",
              child: Text("Sunday", style: TextStyle(fontSize: 18))),
        ]);
  }
}
