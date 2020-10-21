import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Task {
  int id;
  String task;
  String time;

  Task(this.id, this.task, this.time);
}

Future<Database> getdatabase() async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'news.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE tasks(id INTEGER PRIMARY KEY, task TEXT , tid int ,time TEXT ) ",
      );
    },
    version: 1,
  );

  return db;
}

Future<List<Task>> gettasks(int time) async {
  final Database db = await getdatabase();

  final List<Map<String, dynamic>> maps = await db
      .rawQuery("SELECT * FROM tasks WHERE tid <='" + time.toString() + "'");
  return List.generate(maps.length, (i) {
    return Task(maps[i]['id'], maps[i]['task'], maps[i]['time']);
  });
}

Future<bool> deletetask(int id) async {
  final Database db = await getdatabase();
  var t =
      await db.rawQuery("DELETE  FROM tasks WHERE id='" + id.toString() + "'");
  print(t);
}

Future<bool> inserttask(String task, String time) async {
  int id = 0;
  if (time == "10 min") id = 1;
  if (time == "30 min") id = 2;
  if (time == "1 hour") id = 3;
  if (time == "2 hours") id = 4;
  if (time == "1 day") id = 5;
  if (time == "2 days") id = 6;
  if (time == "1 week") id = 7;
  final Database db = await getdatabase();
  var t = await db.insert("tasks", {'task': task, 'tid': id, 'time': time});
  print(t);
}
