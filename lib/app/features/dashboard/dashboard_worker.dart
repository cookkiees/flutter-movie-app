import 'package:get/get.dart';
import 'dart:developer';
import '../../services/api_service.dart';

class DashboardWorker {
  final ApiService apiService = Get.find();

  prosesGetDiscover(page) async =>
      await apiService.fetchDataDiscover(page).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  prosesGetPopular(page) async => await apiService.fetchDataPupular(page).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  prosesGetTopRated(page) async =>
      await apiService.fetchDataTopRated(page).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  prosesGetUpComing(page) async =>
      await apiService.fetchDataUpComing(page).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  prosesGetDetail(id) async => await apiService.fetchDataDetail(id).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  prosesGetGenre() async => await apiService.fetchDataGenre().then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  prosesGetSearch(String query) async =>
      await apiService.fetchDataSearch(query).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );

  prosesGetSimilar(id) async => await apiService.fetchDataSimilar(id).then(
        (value) {
          if (value.statusCode == 200 || value.statusCode == 201) {
            return value.body;
          } else {
            log("${value.statusCode}");
          }
        },
      );
}
