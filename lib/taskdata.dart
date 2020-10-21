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
        "CREATE TABLE tasks(id INTEGER PRIMARY KEY, task TEXT , time TEXT ) ",
      );
    },
    version: 1,
  );

  return db;
}

Future<List<Task>> gettasks(String time) async {
  final Database db = await getdatabase();

  final List<Map<String, dynamic>> maps =
      await db.rawQuery("SELECT * FROM tasks WHERE time='" + time + "'");
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
  final Database db = await getdatabase();
  var t = await db.insert("tasks", {'task': task, 'time': time});
  print(t);
}
