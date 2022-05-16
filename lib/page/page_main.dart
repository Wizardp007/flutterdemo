import 'package:fdemo2/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatefulWidget{

  const MainWidget({Key? key}):super(key: key);

  @override
  MainState createState() => MainState();


}

class MainState extends State<MainWidget>{

  @override
  Widget build(BuildContext context) {
    return Text("观影记录");
  }


}