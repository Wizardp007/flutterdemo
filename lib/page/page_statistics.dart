
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatisticsWidget extends StatefulWidget{

  const StatisticsWidget({Key? key}):super(key: key);

  @override
  StatisticsState createState() => StatisticsState();

}

class StatisticsState extends State<StatisticsWidget>{

  @override
  Widget build(BuildContext context) {
    return Text("统计");
  }


}