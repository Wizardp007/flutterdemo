import 'package:fdemo2/http/http_request.dart';
import 'package:fdemo2/page/secondscreen.dart';
import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyMaterialWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _result = "";
  static const String BASE_URL = "https://api.themoviedb.org/3/";
  static const String key = "c5c821d8780a02eede66063b059576c8";

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      print("count: $_counter");
      // _discover();
    });
  }

  void _discover() async {
    //1.path
    var path = "discover/movie";

    //2.网络请求
    String api = "$path?api_key=$key";
    var _request = HttpRequest(BASE_URL);
    final result = await _request.get(api);


    setState(() {
      result.then((value) => {
        _result = value.toString()
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$_result',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => SecondWidget()),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyMaterialWidget extends StatelessWidget{

  var image = Container(
    child: Image.asset('assets/images/home.png')
  );
  var columnStar = Column(
      mainAxisSize: MainAxisSize.min,
      children:[
        Icon(Icons.star, color: Colors.green[500]),
        Text("Tab1")
      ]
  );
  var star = Row(
    children: [
      Icon(Icons.add_location, color: Colors.green[500]),
      Text("Tab1")
    ],
  );

  Widget _buildRowWidget(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue
      ),
      child: Column(
        children: [
          star,
          star
        ],
      ),
    );
  }

  List<Widget> getImages(int i){
    var images = <Widget>[];
    for(int a = 0;a<i;a++){
      images.add(image);
    }
    return images;
  }

  Widget _buildGraidView(){
    return GridView.extent(maxCrossAxisExtent: 150,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: getImages(30));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello world",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello title")
        ),
        body:_buildGraidView(),
        bottomNavigationBar:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.min,
          children:[
            columnStar,
            columnStar,
            columnStar,
            columnStar,
            columnStar,
            star
          ]
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: Icon(Icons.add),
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondWidget()));
          }
        ),
      ),
    );

  }


}

class MyNormalWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Image.asset('assets/images/home.png')),
          Expanded(flex: 2, child: Image.asset('assets/images/home.png')),
          Expanded(child: Image.asset('assets/images/home.png'))
        ],
      ),
    );
  }

}
