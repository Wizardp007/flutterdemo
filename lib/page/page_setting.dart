import 'package:fdemo2/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingWidget extends StatefulWidget{

  const SettingWidget({Key? key}):super(key: key);

  @override
  SettingState createState() => SettingState();

}

class SettingState extends State<SettingWidget>{


  @override
  Widget build(BuildContext context) {
    return Text("设置");
  }

}