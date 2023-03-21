import 'package:flutter/foundation.dart';

import 'package:fluttermovieapp/app/features/movie/movie_model/genre_model.dart';

import 'package:get/get.dart';

import '../movie/movie_model/detail_movie_model.dart';
import '../movie/movie_model/movie_model.dart';
import '../movie/movie_model/up_coming_movie_model.dart';
import 'dashboard_interactor.dart';

class DashboardController extends GetxController {
  final DashboardInteractor dashboardInteractor = Get.find();

  var tabIndex = 0;

  void changeTabIndex(index) {
    tabIndex = index;
    update();
  }

  var isLoading = false.obs;

  MovieResponseModel? discover;
  getDiscover(page) async {
    isLoading(true);
    try {
      discover = await dashboardInteractor.handleDiscover(page);
      // Print
      if (kDebugMode) {
        print(discover);
      }
    } catch (e) {
      // Print
      if (kDebugMode) {
        print('Erorr getDiscover :  ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }

  MovieResponseModel? popular;
  getPopular(page) async {
    isLoading(true);
    try {
      popular = await dashboardInteractor.handlePopular(page);
      // Print
      if (kDebugMode) {
        print(popular);
      }
    } catch (e) {
      // Print
      if (kDebugMode) {
        print('Erorr getPopular:  ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }

  MovieResponseModel? topRated;
  getTopRated(page) async {
    isLoading(true);
    try {
      topRated = await dashboardInteractor.handleTopRated(page);
      // Print
      if (kDebugMode) {
        print(topRated);
      }
    } catch (e) {
      // Print
      if (kDebugMode) {
        print('Erorr getTopRated :  ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }

  UpComingModel? upComing;
  getUpComing(page) async {
    isLoading(true);
    try {
      upComing = await dashboardInteractor.handleUpComing(page);
      // Print
      if (kDebugMode) {
        print(upComing);
      }
    } catch (e) {
      // Print
      if (kDebugMode) {
        print('Erorr getUpComing:  ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }

  GenreModel? genre;
  getGenre() async {
    isLoading(true);
    try {
      genre = await dashboardInteractor.handleGenre();
      // Print
      if (kDebugMode) {
        print(genre);
      }
    } catch (e) {
      // Print
      if (kDebugMode) {
        print('Erorr getGenre:  ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }

  List<Results> search = [];

  getSearch(query) async {
    isLoading(true);

    try {
      search = await dashboardInteractor.handleSearch(query) as List<Results>;
      // Print
      if (kDebugMode) {
        print("getSearch : $search");
      }
    } catch (e) {
      // Print
      if (kDebugMode) {
        print('Erorr getSearch :  ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }

  DetailMovieModel? detail;
  List<GenresDetail>? genres = [];
  getDetail(id) async {
    isLoading(true);
    try {
      detail = await dashboardInteractor.handleDetail(id);
      genres = detail!.genres as List<GenresDetail>;

      // Print
      if (kDebugMode) {
        print("Detail :$detail");
      }
    } catch (e) {
      // Print
      if (kDebugMode) {
        print('Erorr getDetail :  ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }

  MovieResponseModel? similar;
  getSimilar(id) async {
    isLoading(true);

    try {
      similar = await dashboardInteractor.handleSimilar(id);
      // Print
      if (kDebugMode) {
        print("getSearch : $similar");
      }
    } catch (e) {
      // Print
      if (kDebugMode) {
        print('Erorr getSearch :  ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }
}
