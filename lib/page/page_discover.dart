
import 'package:fdemo2/beans/discover_movie.dart';
import 'package:fdemo2/constant/color.dart';
import 'package:fdemo2/http/api_tmdb.dart';
import 'package:fdemo2/utils_print.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoverWidget extends StatefulWidget{

  const DiscoverWidget({Key? key}):super(key: key);

  @override
  DiscoverState createState() => DiscoverState();

}

class DiscoverState extends State<DiscoverWidget>{

  final TMDBApiRequest _apiRequest = TMDBApiRequest();
  List<DiscoverMovie>? movieList;
  String? data;

  @override
  void initState() {
    super.initState();
    getDiscoverMovie();
  }

  @override
  Widget build(BuildContext context) {
    print("DiscoverState...");
    return Text(data ?? "");
  }


  getDiscoverMovie() async{
     await _apiRequest.discoverMovieBy().then((discoverMovie){
      setState(() {
        data = discoverMovie.toJson().toString();
      });
    });
  }

}