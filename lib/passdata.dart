import 'package:flutter/material.dart';

class passdata extends StatefulWidget {
  static String routename='/pass';
  const passdata({Key? key}) : super(key: key);

  @override
  State<passdata> createState() => _passdataState();
}

class _passdataState extends State<passdata> {
  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> x=ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    print(x);
    return Scaffold(
      appBar: AppBar(),
      body: Center(child:
      Row(children: [
        Container(
          padding:const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border:Border.all(width: 0),
            color:const Color.fromRGBO(238, 238, 238, .83),
          ),
          alignment: Alignment.center,
          width: 200,
          height: 60.0,
          child: FittedBox(child: Text(x['name'],style: TextStyle(fontSize: 25),
          ),
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
          child: FittedBox(child: Text(x['age'],style: TextStyle(fontSize: 25),
          ),
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
          child: FittedBox(child: Text(x['gen'],style: TextStyle(fontSize: 25),
          ),
          ),
        ),
      ],),),
    );
  }
}
