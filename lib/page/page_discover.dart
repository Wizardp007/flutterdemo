import 'package:fdemo2/beans/discover_movie.dart';
import 'package:fdemo2/constant/color.dart';
import 'package:fdemo2/http/api_tmdb.dart';
import 'package:fdemo2/utils_print.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoverWidget extends StatefulWidget {

  const DiscoverWidget({Key? key}) :super(key: key);

  @override
  DiscoverState createState() => DiscoverState();

}

class DiscoverState extends State<DiscoverWidget> {

  final TMDBApiRequest _apiRequest = TMDBApiRequest();
  int? currentPage;
  int? totalPages;
  int? totalResults;
  List<Results> movieList = [];


  @override
  void initState() {
    super.initState();
    getDiscoverMovie();
  }

  @override
  Widget build(BuildContext context) {
    print("DiscoverState...");
    return  GridView.count(
      restorationId: 'grid_view_demo_grid_offset',
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(8),
      childAspectRatio: 1,
      children: getItems(),
    );
  }


  getDiscoverMovie() async {
    await _apiRequest.discoverMovieBy().then((discoverMovie) {
      setState(() {
        currentPage = discoverMovie.page;
        if (discoverMovie.results != null) {
          movieList.addAll(discoverMovie.results!);
        }
      });
    });
  }

  List<_GridDemoPhotoItem> getItems(){
    int length = 3;
    if(movieList != null){
      length = movieList.length;
    }
    List<_GridDemoPhotoItem> list = <_GridDemoPhotoItem>[];
    for(int i = 0;i < length;i++){
      Results movie = movieList[i];
      _GridDemoPhotoItem _gridDemoPhotoItem = _GridDemoPhotoItem(movie: movie);
      list.add(_gridDemoPhotoItem);
    }
    return list;
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  const _GridDemoPhotoItem({
    required this.movie,
  });

  final Results movie;

  @override
  Widget build(BuildContext context) {

    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Center(child: FadeInImage.assetNetwork(
        image: '${TMDBApiRequest.IMAGE_URL}'+'${movie.posterPath}',
        placeholder: 'assets/images/home.png' )
      ),
    );

    return GridTile(
      header: Material(
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar (
          title:Text(movie.title ?? "无title"),
          backgroundColor: Colors.black45,
        ),
      ),
      child: image,
    );
  }
}