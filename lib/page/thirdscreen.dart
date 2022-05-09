import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "统计",
      home: Scaffold(
        appBar: AppBar(title: Text("统计")),
        body: buildHome(),
      ),
    );
  }

  Widget buildHome() {
    return Column(
      children: [
        Image.asset("assets/images/home.png"),
        buildTitle(),
        buildButton(),
        const Padding(padding: EdgeInsets.all(32),
        child:  Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
              'Alps. Situated 1,578 meters above sea level, it is one of the '
              'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
              'half-hour walk through pastures and pine forest, leads you to the '
              'lake, which warms to 20 degrees Celsius in the summer. Activities ',
         ))

      ],
    );
  }

  Widget buildTitle() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(child:  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Oeschinen Lake Campground",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Kandersteg, Switzerland")
          ])),
          Icon(Icons.star, color: Colors.red),
          Text("41")
        ],
      ),
    );
  }

  Widget buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.star, color: Colors.blue), Text("data")],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.star, color: Colors.blue), Text("data")],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.star, color: Colors.blue), Text("data")],
        )
      ],
    );
  }
}
