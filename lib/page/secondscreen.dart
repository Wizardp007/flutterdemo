import 'package:fdemo2/page/thirdscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondWidget extends StatefulWidget {
  SecondWidget({Key? key}) : super(key: key);

  @override
  SecondState createState() => SecondState();
}

class SecondState extends State<SecondWidget> {
  bool _isFav = true;
  int star = 41;

  @override
  Widget build(BuildContext context) {
    return buildRow(context);
  }

  Widget buildRow(BuildContext context) {
    return MaterialApp(
        title: "Hello world",
        home: Scaffold(
          appBar: AppBar(title: const Text("Hello title")),
          body: getBody(),
          floatingActionButton: FloatingActionButton(
              tooltip: 'Increment',
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThirdScreen()));
              }),
        ));
  }

  Widget getBody() {
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/home.png"),
                radius: 100,
              ),
            )),
        Container(
          decoration: BoxDecoration(color: Colors.black45),
          child: Text(
            "Hello 小闫",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              padding: const EdgeInsets.all(0),
              alignment: Alignment.centerRight,
              icon: (_isFav
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite,
            ),
            SizedBox(
              width: 18,
              child: SizedBox(
                child: Text('$star'),
              ),
            ),
          ],
        )
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFav) {
        star -= 1;
        _isFav = false;
      } else {
        star += 1;
        _isFav = true;
      }
    });
  }
}
