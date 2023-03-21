import 'package:fluttermovieapp/app/features/movie/movie_model/detail_movie_model.dart';
import 'package:fluttermovieapp/app/features/movie/movie_model/genre_model.dart';
import 'package:get/get.dart';
import '../movie/movie_model/movie_model.dart';
import '../movie/movie_model/up_coming_movie_model.dart';
import 'dashboard_worker.dart';

class DashboardInteractor {
  final DashboardWorker dashboardWorker = Get.find();

  Future<MovieResponseModel?> handleDiscover(page) async {
    var discover = await dashboardWorker.prosesGetDiscover(page);

    var movieResponseModel = MovieResponseModel.fromJson(discover);

    return movieResponseModel;
  }

  Future<MovieResponseModel?> handlePopular(page) async {
    var popular = await dashboardWorker.prosesGetPopular(page);

    var movieResponseModel = MovieResponseModel.fromJson(popular);

    return movieResponseModel;
  }

  Future<MovieResponseModel?> handleTopRated(page) async {
    var topRated = await dashboardWorker.prosesGetTopRated(page);

    var movieResponseModel = MovieResponseModel.fromJson(topRated);

    return movieResponseModel;
  }

  Future<List<Results>?> handleSearch(query) async {
    var search = await dashboardWorker.prosesGetSearch(query);

    var movieResponseModel = MovieResponseModel.fromJson(search).results;

    return movieResponseModel;
  }

  Future<UpComingModel?> handleUpComing(page) async {
    var upComing = await dashboardWorker.prosesGetUpComing(page);

    var upComingModel = UpComingModel.fromJson(upComing);

    return upComingModel;
  }

  Future<DetailMovieModel?> handleDetail(id) async {
    var detail = await dashboardWorker.prosesGetDetail(id);

    var detailMovieModel = DetailMovieModel.fromJson(detail)
      ..genres
      ..productionCountries;

    return detailMovieModel;
  }

  Future<GenreModel?> handleGenre() async {
    var genre = await dashboardWorker.prosesGetGenre();

    var genreModel = GenreModel.fromJson(genre);

    return genreModel;
  }

  Future<MovieResponseModel?> handleSimilar(id) async {
    var similar = await dashboardWorker.prosesGetSimilar(id);

    var movieResponseModel = MovieResponseModel.fromJson(similar);

    return movieResponseModel;
  }
}
