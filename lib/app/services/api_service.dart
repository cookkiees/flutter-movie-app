import 'package:get/get.dart';

class ApiService extends GetConnect {
  final url = "https://api.themoviedb.org/3";
  final apiKey = "?api_key=211f4c87201b1360ba83e15446ed5790";

  //? GET MOVIES

  //! GET DISCOVER MOVIE

  Future<Response> fetchDataDiscoverMovie(page) =>
      get("$url/discover/movie$apiKey&page=$page");

  //! GET POPULAR MOVIE

  Future<Response> fetchDataPupularMovie(page) =>
      get("$url/movie/popular$apiKey&page=$page");

  //! GET TOP RATED MOVIE

  Future<Response> fetchDataTopRatedMovie(page) =>
      get("$url/movie/top_rated$apiKey&page=$page");

  //! GET UP COMING MOVIE

  Future<Response> fetchDataUpComingMovie(page) =>
      get("$url/movie/upcoming$apiKey&page=$page");

  //! GET SEARCH MOVIE

  Future<Response> fetchDataSearchMovie(query) =>
      get("$url/search/movie$apiKey&query=$query");

  //! GET IMAGES MOVIE

  Future<Response> fetchDataImagesMovie(id) async =>
      get("$url/movie/$id/images$apiKey");

  //! GET GENRES MOVIE

  Future<Response> fetchDataGenreMovie(genreIds) =>
      get("$url/genre/movie/list$apiKey");

  //! GET TRENDING MOVIE

  Future<Response> fetchDataTrendingMovie(media, time) =>
      get("$url/trending/$media/$time$apiKey");

  //! GET DETAILS MOVIE

  Future<Response> fetchDataDetailMovie(id) => get("$url/movie/$id$apiKey");

  //! GET VIDEOS MOVIE

  Future<Response> fetchDataVideosMovie(id) =>
      get("$url/movie/$id/videos$apiKey");

  //! GET CREDITS MOVIE

  Future<Response> fetchDataCreditMovie(id) =>
      get("$url/movie/$id/credits$apiKey");

  //! GET SIMILAR MOVIE

  Future<Response> fetchDataSimilarMovie(id) =>
      get("$url/movie/$id/similar$apiKey");

  //? GET TV

  //! GET TV RECOMMENDATIONS

  Future<Response> fetchDataTVRecommendations(id, page) =>
      get("$url/tv/$id/recommendations$apiKey&page=$page");

  //! GET TV DETAILS

  Future<Response> fetchDataTVDetails(id) => get("$url/tv/$id$apiKey");

  //! GET TV CREDITS

  Future<Response> fetchDataTVCredits(id) => get("$url/tv/$id/credits$apiKey");

  //! GET TV SIMILAR

  Future<Response> fetchDataTVSimilar(id) => get("$url/tv/$id/similar$apiKey");

  //! GET TV ON AIRING TODAY

  Future<Response> fetchDataTVOnTheAiring(page) =>
      get("$url/tv/on_the_air$apiKey&page=$page");

  //! GET TV POPULAR

  Future<Response> fetchDataTVPopular(page) =>
      get("$url/tv/popular$apiKey&page=$page");

  //! GET TV TOP RATED

  Future<Response> fetchDataTVTopRated(page) =>
      get("$url/tv/top_rated$apiKey&page=$page");
}

class ApiServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService());
  }
}
