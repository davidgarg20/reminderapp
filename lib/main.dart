import 'package:flutter/material.dart';
import 'addtask.dart';
import 'taskdata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {"\addtask": (context) => AddTask()});
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool free1 = true;
  bool free = false;
  bool selected = false;
  bool taskempty = false;
  String selcetedtime = "5 min";
  bool addtask = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Time Utlilizer"),
        ),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            free1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Text(
                          "I'm free",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            free1 = false;
                            free = true;
                          });
                        },
                      ),
                    ],
                  )
                : Padding(padding: EdgeInsets.all(0)),
            free
                ? Text(
                    "How much free time you have",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Padding(padding: EdgeInsets.all(0)),
            selected
                ? Text(
                    "Pick up a task",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Padding(padding: EdgeInsets.all(0)),
            taskempty
                ? Column(
                    children: [
                      Text(
                        "No task available for this time",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                : Padding(padding: EdgeInsets.all(0)),
            Spacer(),
            free
                ? Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlineButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "5 min",
                            style: TextStyle(
                                color: Color.fromRGBO(251, 101, 66, 1.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              selcetedtime = "5 min";

                              free = false;
                              selected = true;
                            });
                          },
                        ),
                        OutlineButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "10 min",
                            style: TextStyle(
                                color: Color.fromRGBO(251, 101, 66, 1.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              selcetedtime = "10 min";

                              free = false;
                              selected = true;
                            });
                          },
                        ),
                        OutlineButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "30 min",
                            style: TextStyle(
                                color: Color.fromRGBO(251, 101, 66, 1.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              selcetedtime = "30 min";

                              free = false;
                              selected = true;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlineButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "1 hour",
                            style: TextStyle(
                                color: Color.fromRGBO(251, 101, 66, 1.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              selcetedtime = "1 hour";

                              free = false;
                              selected = true;
                            });
                          },
                        ),
                        OutlineButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "2 hours",
                            style: TextStyle(
                                color: Color.fromRGBO(251, 101, 66, 1.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              selcetedtime = "2 hours";

                              free = false;
                              selected = true;
                            });
                          },
                        ),
                        OutlineButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "1 day",
                            style: TextStyle(
                                color: Color.fromRGBO(251, 101, 66, 1.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              selcetedtime = "2 days";

                              free = false;
                              selected = true;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlineButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "2 days",
                            style: TextStyle(
                                color: Color.fromRGBO(251, 101, 66, 1.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              selcetedtime = "2 days";

                              free = false;
                              selected = true;
                            });
                          },
                        ),
                        OutlineButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "1 week",
                            style: TextStyle(
                                color: Color.fromRGBO(251, 101, 66, 1.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              selcetedtime = "1 week";

                              free = false;
                              selected = true;
                            });
                          },
                        ),
                      ],
                    )
                  ])
                : Padding(padding: EdgeInsets.all(0)),
            selected
                ? Container(
                    child: FutureBuilder(
                        future: gettasks(selcetedtime),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Task>> snapshot) {
                          if (snapshot.hasData) {
                            List<Task> tasks = snapshot.data.toList();
                            print(tasks);
                            if (tasks.length == 0) {
                              return Column(
                                children: [
                                  Center(
                                    child: SizedBox(
                                        height: 200,
                                        child: Text(
                                          "No task available for this time",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        )),
                                  ),
                                ],
                              );
                            }
                            return SingleChildScrollView(
                                child: SizedBox(
                              height: 200,
                              child: ListView.builder(
                                  itemCount: tasks.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.75,
                                              child: Text(
                                                tasks.elementAt(index).task,
                                                maxLines: 5,
                                                style: TextStyle(fontSize: 16),
                                                overflow: TextOverflow.clip,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: OutlineButton(
                                              onPressed: () {
                                                deletetask(
                                                    tasks.elementAt(index).id);
                                                setState(() {
                                                  selected = false;
                                                  free1 = true;
                                                });
                                              },
                                              child: Text(
                                                "PickUp",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        251, 101, 66, 1.0)),
                                              ),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        30.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ));
                          } else
                            return Center(child: CircularProgressIndicator());
                        }),
                  )
                : Padding(padding: EdgeInsets.all(0)),
            Spacer(),
            GestureDetector(
              child: RaisedButton(
                child: Text("Add Task"),
                color: Colors.lightBlue,
                onPressed: () {
                  Navigator.of(context).pushNamed("\addtask");
                },
              ),
              onTap: () {
                setState(() {
                  addtask = true;
                });
              },
            ),
            Spacer(),
          ],
        )));
  }
}
