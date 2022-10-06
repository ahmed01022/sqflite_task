

import 'package:flutter/material.dart';
import 'package:sqlflite_task/passdata.dart';
import 'data.dart';
import 'db.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static String routename='/';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  String gender="Male";
  List<String> genderList=[
    "Male",
    "Female"
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("sqflite"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Your Data ",style:TextStyle(fontSize: 30),),
              Form(child:Column(
                children: [
                  Container(
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: .3)
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                    child: TextFormField(
                      controller:nameController ,
                      decoration: InputDecoration(
                        hintText: "Enter Your Name ",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 0,
                          color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: .3)
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                    child: TextFormField(
                      controller:ageController ,
                      decoration: InputDecoration(
                        hintText: "Enter Your Age ",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 0,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: .3)
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            readOnly:true,
                            decoration: InputDecoration(
                              hintText: gender,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0,
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 0,
                                    color: Colors.white),
                              ),
                            ),

                          ),
                        ),
                        DropdownButton(
                          value: gender,
                          items: genderList.map((e) => DropdownMenuItem(
                              value:e,
                              child:Text(e,style: TextStyle(color:Colors.white),)),
                          ).toList(),
                          onChanged: (String? c){
                            setState(() {
                              gender=c!;
                            });
                          },
                          icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                          underline: Container(height: 0,),
                            dropdownColor:Colors.grey,
                            borderRadius:BorderRadius.circular(10),

                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    if(nameController.text.isNotEmpty && ageController.text.isNotEmpty){
                      DBHealper.insert(
                        name: nameController.text,
                        age: double.tryParse(ageController.text)??0,
                        gen: gender=="Male"? 0:1 ,
                      );

                      Navigator.pushNamed(context,passdata.routename,arguments: {
                        'name':nameController.text.toString(),
                        "age":ageController.text,
                        "gen":gender
                      });
                      nameController.clear();
                      ageController.clear();
                    }
                  },
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text("OK",style: TextStyle(fontSize: 20),),
                      )),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: ()async{
                    List<Map<String, Object?>> cc =await DBHealper.getdata();
                    Navigator.pushNamed(context,data.routename,arguments: {
                      "list":cc,
                    });
                  },
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text("Show Data",style: TextStyle(fontSize: 20),),
                      )),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }


}
