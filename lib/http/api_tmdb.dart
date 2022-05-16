import 'package:fdemo2/beans/discover_movie.dart';
import 'package:fdemo2/http/api_path.dart';
import 'package:fdemo2/http/http_request.dart';
import 'package:fdemo2/utils_print.dart';

class TMDBApiRequest {

  static const String BASE_URL = "https://api.themoviedb.org/3";
  static const String key = "你的tmdkey";



  Future<DiscoverMovie> discoverMovieBy() async {
    //1.path
    var path = ApiConstant.path_discover_movie;

    //2.网络请求
    String api = '$path?api_key=$key&language=zh-CN&sort_by=popularity.desc&include_adult=true&include_video=false&page=1&with_watch_monetization_types=flatrate';
    var _request = HttpRequest(BASE_URL);
    final result = await _request.get(api);

    DiscoverMovie discoverMovie = DiscoverMovie.fromJson(result);

    print(discoverMovie.toString());

    return Future.value(discoverMovie);

  }


  void _discoverTV() async {
    //1.path
    var path = "discover/movie";

    //2.网络请求
    String api = "$path?api_key=$key";
    var _request = HttpRequest(BASE_URL);
    final result = await _request.get(api);


  }

}