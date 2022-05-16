import 'package:fdemo2/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget{

  const ListWidget({Key? key}):super(key: key);

  @override
  ListState createState() => ListState();


}

class ListState extends State<ListWidget>{

  @override
  Widget build(BuildContext context) {
    return Text("片单");
  }


}