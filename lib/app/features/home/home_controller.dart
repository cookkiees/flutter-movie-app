import 'dart:convert';

import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:fluttermovieapp/app/services/app_constants.dart';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../movie/genre_model.dart';
import '../movie/movie_model.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  var isLoading = false.obs;

  MovieModel? dataMovie;
  GenreModel? dataGenre;

  var pages = 2.obs;

  getPopular(page) async {
    await getAllMovie(page = pages, "/movie/popular");
    update();
  }

  getDiscover(page) async {
    await getAllMovie(page = pages, "/discover/movie");
    update();
  }

  getTopRated(page) async {
    await getAllMovie(page = pages, "/movie/top_rated");
    update();
  }

  getAllMovie(page, movies) async {
    isLoading(true);
    try {
      var response = await http.get(
        Uri.parse(
          "${AppConstant.baseUrl}$movies?api_key=${AppConstant.apiKey}&page=$pages",
        ),
      );
      if (response.statusCode == 200) {
        log("Get All Movie");
        var data = json.decode(response.body);

        dataMovie = MovieModel.fromJson(data);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }

  genreMovie() async {
    isLoading(true);
    try {
      var response = await http.get(
        Uri.parse(
          "https://api.themoviedb.org/3/genre/movie/list?api_key=211f4c87201b1360ba83e15446ed5790",
        ),
      );
      if (response.statusCode == 200) {
        log("Genre Movie");
        var data = json.decode(response.body);

        dataGenre = GenreModel.fromJson(data);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }
}
