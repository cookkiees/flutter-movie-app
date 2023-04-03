import 'package:get/get.dart';
import '../features/dashboard/dashboard_binding.dart';
import '../features/dashboard/dashboard_page.dart';
import '../features/home/views/favorite_screen.dart';
import '../features/home/views/home_screen.dart';
import '../features/movie/views/detail_movie_screen.dart';
import '../features/movie/views/popular_movie_screen.dart';
import '../features/movie/views/search_genre_screen.dart';
import '../features/movie/views/toprated_movie_screen.dart';
import '../features/tv/views/tv_details_screen.dart';
import 'app_routers.dart';

class AppPages {
  static const initial = AppRouters.dashboard;

  static final routes = [
    GetPage(
      name: AppRouters.home,
      page: () => const HomeScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRouters.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRouters.topRatedMovie,
      page: () => const TopRatedMovieScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRouters.popularMovie,
      page: () => const PopularMovieScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRouters.favorite,
      page: () => const FavoriteScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: '${AppRouters.detailMovie}/:id',
      page: () => const DetailMovie(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: '${AppRouters.genreMovie}/:genreIds/:name',
      page: () => const SearchGenreScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: '${AppRouters.tvDetails}/:id',
      page: () => const TVDetailsScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
