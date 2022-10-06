import 'package:flutter/material.dart';
import 'package:sqlflite_task/passdata.dart';

import 'data.dart';
import 'db.dart';
import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBHealper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyHomePage.routename,
      routes: {
        MyHomePage.routename: (ctx) => MyHomePage(),
        passdata.routename: (ctx) => passdata(),
        data.routename: (ctx) => data(),
      }
    );
  }
}
