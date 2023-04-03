import 'package:get/get.dart';
import 'dart:developer';
import '../../services/api_service.dart';

class DashboardWorker {
  final ApiService apiService = Get.find();

  //! GET DISCOVER MOVIE

  prosesGetDiscoverMovie(page) async =>
      await apiService.fetchDataDiscoverMovie(page).then(
        (value) async {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET POPULAR MOVIE

  prosesGetPopularMovie(page) async =>
      await apiService.fetchDataPupularMovie(page).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET TOP RATED MOVIE

  prosesGetTopRatedMovie(page) async =>
      await apiService.fetchDataTopRatedMovie(page).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET UP COMING MOVIE

  prosesGetUpComingMovie(page) async =>
      await apiService.fetchDataUpComingMovie(page).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET DETAILS MOVIE

  prosesGetDetailMovie(id) async =>
      await apiService.fetchDataDetailMovie(id).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET GENRES MOVIE

  prosesGetGenreMovie(genreIds) async =>
      await apiService.fetchDataGenreMovie(genreIds).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET SEARCH MOVIE

  prosesGetSearchMovie(query) async =>
      await apiService.fetchDataSearchMovie(query).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET SIMILAR MOVIE

  prosesGetSimilarMovie(id) async =>
      await apiService.fetchDataSimilarMovie(id).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET VIDEOS MOVIE

  prosesGetVideosMovie(id) async =>
      await apiService.fetchDataVideosMovie(id).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET CREDITS MOVIE

  prosesGetCreditMovie(id) async =>
      await apiService.fetchDataCreditMovie(id).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET IMAGES MOVIE

  prosesGetImagesMovie(id) async =>
      await apiService.fetchDataImagesMovie(id).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET TRANDING MOVIE

  prosesGetTrandingMovie(media, time) async =>
      await apiService.fetchDataTrendingMovie(media, time).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //? GET TV

  //! GET TV RECOMMENDATIONS

  prosesGetTVRecommendations(id, page) async =>
      await apiService.fetchDataTVRecommendations(id, page).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET TV DETAILS

  prosesGetTVDetails(id) async => await apiService.fetchDataTVDetails(id).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET TV CREDITS

  prosesGetTVCredits(id) async => await apiService.fetchDataTVCredits(id).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET TV SIMILAR

  prosesGetTVSimilar(id) async => await apiService.fetchDataTVSimilar(id).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET TV ON THE AIRING

  prosesGetTVOnTheAiring(page) async =>
      await apiService.fetchDataTVOnTheAiring(page).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET TV POPULAR

  prosesGetTVPopular(page) async =>
      await apiService.fetchDataTVPopular(page).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  //! GET TV TOP RATED

  prosesGetTVTopRated(page) async =>
      await apiService.fetchDataTVTopRated(page).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );
}
