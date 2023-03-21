import 'package:get/get.dart';

class ApiService extends GetConnect {
  final url = "https://api.themoviedb.org/3";
  final apiKey = "?api_key=211f4c87201b1360ba83e15446ed5790";

  Future<Response> fetchDataDiscover(page) =>
      get("$url/discover/movie$apiKey&page=$page");

  Future<Response> fetchDataPupular(page) async =>
      get("$url/movie/popular$apiKey&page=$page");

  Future<Response> fetchDataTopRated(page) async =>
      get("$url/movie/top_rated$apiKey&page=$page");

  Future<Response> fetchDataUpComing(page) async =>
      get("$url/movie/upcoming$apiKey&page=$page");

  Future<Response> fetchDataGenre() async =>
      get("$url/genre/movie/list$apiKey");

  Future<Response> fetchDataSearch(String query) async =>
      get("$url/search/movie$apiKey&query=$query");

  Future<Response> fetchDataDetail(id) async => get("$url/movie/$id$apiKey");

  Future<Response> fetchDataSimilar(id) async =>
      get("$url/movie/$id/similar$apiKey&query=$query");
}

class ApiServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService());
  }
}
