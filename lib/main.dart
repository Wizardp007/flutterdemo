import 'package:fdemo2/page/page_discover.dart';
import 'package:fdemo2/page/page_main.dart';
import 'package:fdemo2/page/page_movie_list.dart';
import 'package:fdemo2/page/page_setting.dart';
import 'package:fdemo2/page/page_statistics.dart';
import 'package:flutter/material.dart';

import 'constant/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:ColorConstant.colorPrimary,
      ),
      home: MyHomePage(title: 'iMoter'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  int currentBottomIndex = 0;
  List<Widget> pageWidgets = [
    const MainWidget(),
    const ListWidget(),
    const StatisticsWidget(),
    const DiscoverWidget(),
    const SettingWidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar'))
                );
              },
            ),
          )
        ],
      ),
      body: pageWidgets[currentBottomIndex],
      bottomNavigationBar: getBottomNavigationBar()// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget getBottomNavigationBar(){
    return BottomNavigationBar(
      selectedItemColor: ColorConstant.colorPrimary[500],
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(
          color: ColorConstant.colorPrimary[500]
      ),
      unselectedLabelStyle: TextStyle(
          color: Colors.grey
      ),
      onTap: onTapChanged,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: "观影记录"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "我的片单"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.moving_rounded),
            label: "统计"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.recommend),
            label: "发现"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "设置"
        )
      ],
      currentIndex:currentBottomIndex,
    );
  }

  void onTapChanged(int index){
    setState(() {
      currentBottomIndex = index;
    });
  }

  Widget _buildGraidView(){
    return Align(alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.asset('assets/images/home.png'),
            ),
            Expanded(
              flex: 2,
              child: Image.asset('assets/images/home.png'),
            ),
            Expanded(
              child: Image.asset('assets/images/home.png'),
            ),
          ],
        ));
  }

}
