import 'package:flutter/material.dart';
import 'taskdata.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

List<String> times = [
  '5 min',
  '10 min',
  '30 min',
  '1 hour',
  '2 hours',
  '1 day',
  '2 days',
  '1 week'
];

class _AddTaskState extends State<AddTask> {
  var selectedLocation = "5 min";
  bool error = false;
  String errordetail = "Error";
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Task")),
        body: Container(
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Enter Task Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  )),
                  maxLines: 5,
                ),
              ),
              Spacer(),
              Text("Select Time Required",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              DropdownButton(
                value: selectedLocation,
                items: times.map((String time) {
                  return new DropdownMenuItem<String>(
                    child: new Text(time),
                    value: time,
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    selectedLocation = newValue;
                  });
                },
              ),
              Spacer(),
              error
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        errordetail,
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.all(0),
                    ),
              RaisedButton(
                onPressed: () async {
                  if (controller.text.isEmpty) {
                    setState(() {
                      error = true;
                      errordetail = "Please Enter Task Detail";
                    });
                  } else {
                    await inserttask(controller.text, selectedLocation);
                    Navigator.of(context).pop();
                  }
                },
                child: Text("Add Task"),
                color: Colors.lightBlueAccent,
              ),
              Spacer(),
            ],
          ),
        ));
  }
}
