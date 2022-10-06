import 'package:flutter/material.dart';

import 'db.dart';

class data extends StatefulWidget {
  static String routename='/data';
  const data({Key? key}) : super(key: key);

  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {
  @override
  Widget build(BuildContext context) {
    Map<String,List<Map<String, Object?>>> li=ModalRoute.of(context)!.settings.arguments as Map<String,List<Map<String, Object?>>>;
    return Scaffold(
      appBar:AppBar(title: Text("Data"),),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: li['list']!.map((e) => Row(
              children: [
                Container(
                  padding:const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border:Border.all(width: 0),
                    color:const Color.fromRGBO(238, 238, 238, .83),
                  ),
                  alignment: Alignment.center,
                  width: 200,
                  height: 60.0,
                  child: Text(e['name'].toString(),style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  padding:const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border:Border.all(width: 0),
                    color:const Color.fromRGBO(238, 238, 238, .83),
                  ),
                  alignment: Alignment.center,
                  width: 100,
                  height: 60.0,
                  child: Text(e['age'].toString(),style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  padding:const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border:Border.all(width: 0),
                    color:const Color.fromRGBO(238, 238, 238, .83),
                  ),
                  alignment: Alignment.center,
                  width: 100,
                  height: 60.0,
                  child: Text(e['gender']==0? "Male":"Female",style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),).toList(),
          ),
        ),
      ),
    );
  }
}
