import 'package:flutter/material.dart';

class ChooseDayList extends StatefulWidget {
  const ChooseDayList({super.key});

  @override
  State<ChooseDayList> createState() => _ChooseDayListState();
}

class _ChooseDayListState extends State<ChooseDayList> {
  String dropDownValue = "Monday";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: dropDownValue,
        onChanged: (String? newValue) {
          setState(() {
            dropDownValue = newValue!;
          });
        },
        items: const [
          DropdownMenuItem(value: "Tuesday", child: Text("Tuesday")),
          DropdownMenuItem(value: "Wenesday", child: Text("Wenesday")),
          DropdownMenuItem(value: "Thursday", child: Text("Thursday")),
          DropdownMenuItem(value: "Friday", child: Text("Friday")),
          DropdownMenuItem(value: "Saurday", child: Text("Saurday")),
          DropdownMenuItem(value: "Sunday", child: Text("Sunday")),
        ]);
  }
}
