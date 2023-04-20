import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../movie/models/credits_movie.dart';
import '../movie/models/detail_movie_model.dart';
import '../movie/models/genre_model.dart';
import '../movie/models/image_model.dart';
import '../movie/models/movie_model.dart';
import '../movie/models/up_coming_movie_model.dart';
import '../movie/models/videos_model.dart';
import '../tv/models/tv_credits_model.dart';
import '../tv/models/tv_details_model.dart';
import '../tv/models/tv_response_model.dart';
import 'dashboard_interactor.dart';

class DashboardController extends GetxController {
  final DashboardInteractor dashboardInteractor = Get.find();
  ScrollController scrollController = ScrollController();
  late YoutubePlayerController youtubeController;

  var isLoading = false.obs;
  var isLoadingMore = false.obs;
  var youtubeKey = "";
  var page = 1.obs;

  @override
  void onInit() async {
    youtubeController = YoutubePlayerController(
      initialVideoId: youtubeKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: false,
      ),
    );
    super.onInit();
    scrollController.addListener(_scrollController);
    getPopularMovie(page++);
    getTopRatedMovie(page++);
  }

//! GET SCROLL UPDATE PAGE MOVIE && GET VIDEOS MOVIE

  _scrollController() async {
    try {
      if (isLoadingMore(true) &&
          scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
        await getPopularMovie(page++);
        await getTopRatedMovie(page++);
      } else {}
    } catch (e) {
      if (kDebugMode) {
        print('$e');
      }
    } finally {
      isLoadingMore(false);
    }
  }

  //! GET VIDEOS MOVIE

  VideosModel? videosMovie;

  getVideosMovie(id) async {
    isLoading(true);

    try {
      videosMovie = await dashboardInteractor.handleVideosMovie(id);
    } catch (e) {
      debugPrint(" Error Get Videos Movie: $e");
    } finally {
      isLoading(false);
    }
  }

  //! BOTTOM NAVIGATION BAR

  var tabIndex = 0;

  void changeTabIndex(index) {
    tabIndex = index;
    update();
  }

  //! GET TRENDING MOVIE

  List<Results>? trendingMovie;
  getTrendingMovie(media, time) async {
    isLoading(true);

    try {
      trendingMovie =
          await dashboardInteractor.handleTrandingMovie(media, time);
    } catch (e) {
      debugPrint(" Error Get Trending Movie: $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET DISCOVER MOVIE

  final discoverMovie = <Results>[].obs;
  getDiscoverMovie(page) async {
    isLoading(true);

    try {
      var discover = await dashboardInteractor.handleDiscoverMovie(page);

      discover?.forEach((element) => discoverMovie.add(element));
    } catch (e) {
      debugPrint(" Error Get Discover Movie: $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET POPULAR MOVIE

  final popularMovie = <Results>[].obs;
  getPopularMovie(page) async {
    isLoading(true);
    try {
      var popular = await dashboardInteractor.handlePopularMovie(page);

      popular?.forEach((element) => popularMovie.add(element));
    } catch (e) {
      debugPrint(" Error Get Popular Movie: $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET TOPRATED MOVIE

  final topRatedMovie = <Results>[].obs;
  getTopRatedMovie(page) async {
    isLoading(true);
    try {
      var topRated = await dashboardInteractor.handleTopRatedMovie(page);
      topRated?.forEach((element) => topRatedMovie.add(element));
    } catch (e) {
      // Print
      debugPrint(" Error Get Top Rated Movie: $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET UP COMING MOVIE

  final upComingMovie = <ResultsUpComing>[].obs;
  getUpComingMovie(page) async {
    isLoading(true);
    try {
      var upComing = await dashboardInteractor.handleUpComingMovie(page);

      upComing?.forEach((element) => upComingMovie.add(element));
    } catch (e) {
      debugPrint(" Error Get Up Coming Movie: $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET GENRES MOVIE

  final genreMovie = <Genres>[].obs;
  getGenreMovie(genreIds) async {
    isLoading(true);
    try {
      var genre = (await dashboardInteractor.handleGenreMovie(genreIds));

      genre?.forEach((element) => genreMovie.add(element));
    } catch (e) {
      debugPrint(" Error Get Genre Movie: $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET SEARCH MOVIE

  var query = "";
  List<Results> find = <Results>[].obs;

  myState() {
    find.clear();
    if (query.isEmpty) {
    } else {
      getSearchMovie(query);
    }
  }

  myState2(value) {
    query = value;
  }

  List<Results> search = [];
  getSearchMovie(query) async {
    isLoading(true);

    try {
      search =
          await dashboardInteractor.handleSearchMovie(query) as List<Results>;
    } catch (e) {
      debugPrint(" Error Get Search Movie : $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET DETAILS MOVIE

  DetailMovieModel? detailMovie;
  List<GenresDetail>? genreDetails = [];
  getDetailMovie(id) async {
    isLoading(true);
    try {
      detailMovie = await dashboardInteractor.handleDetailMovie(id);
      genreDetails = detailMovie!.genres as List<GenresDetail>;
    } catch (e) {
      debugPrint(" Error Get Detail Movie: $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET SIMILAR MOVIE

  final similarMovie = <Results>[].obs;
  getSimilarMovie(id) async {
    isLoading(true);

    try {
      var similar = await dashboardInteractor.handleSimilarMovie(id);

      similar?.forEach((element) => similarMovie.add(element));
    } catch (e) {
      debugPrint(" Error Get Similar Movie : $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET CREDITS MOVIE

  CreditMovieModel? creditMovie;
  getCreditMovie(id) async {
    isLoading(true);

    try {
      creditMovie = await dashboardInteractor.handleCreditMovie(id);
    } catch (e) {
      debugPrint(" Error Get Credit Movie: $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET IMAGES MOVIE

  ImagesMovieModel? imageMovie;
  getImageMovie(id) async {
    isLoading(true);

    try {
      imageMovie = await dashboardInteractor.handleImageMovie(id);
    } catch (e) {
      debugPrint(" Error Get Images Movie: $e");
    } finally {
      isLoading(false);
    }
  }

  //? GET TV

  //! GET TV RECOMMENDATIONS

  final tvRecommendations = <ResultsTV>[].obs;
  getTVRecommendations(id, page) async {
    isLoading(true);
    try {
      var recommendations =
          await dashboardInteractor.handleTVRecommendations(id, page);

      recommendations?.forEach((element) => tvRecommendations.add(element));
    } catch (e) {
      debugPrint(" Error Get TV Recommendations : $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET TV DETAILS

  TVDetailsModel? tvDetails;
  getTVDetails(id) async {
    isLoading(true);
    try {
      tvDetails = await dashboardInteractor.handleTVDetails(id);
    } catch (e) {
      debugPrint(" Error Get TV Details : $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET TV CREDITS

  TVCreditsModel? tvCredits;
  getTVCredits(id) async {
    isLoading(true);
    try {
      tvCredits = await dashboardInteractor.handleTVCredits(id);
    } catch (e) {
      debugPrint(" Error Get  TVCredits : $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET TV SIMILAR

  final tvSimilar = <ResultsTV>[].obs;
  getTVSimilar(id) async {
    isLoading(true);
    try {
      var similar = await dashboardInteractor.handleTVSimilar(id);

      similar?.forEach((element) => tvSimilar.add(element));
    } catch (e) {
      debugPrint(" Error Get TV Simmilar : $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET TV ON THE AIRING

  final tvOnTheAiring = <ResultsTV>[].obs;
  getTVOnTheAiring(page) async {
    isLoading(true);
    try {
      var onTheAiring = await dashboardInteractor.handleTVOnTheAiring(page);

      onTheAiring?.forEach((element) => tvOnTheAiring.add(element));
    } catch (e) {
      debugPrint(" Error Get TV On The Airing  : $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET TV POPULAR

  final tvPopular = <ResultsTV>[].obs;
  getTVPopular(page) async {
    isLoading(true);
    try {
      var popular = await dashboardInteractor.handleTVPopular(page);

      popular?.forEach((element) => tvPopular.add(element));
    } catch (e) {
      debugPrint(" Error Get TV Popular : $e");
    } finally {
      isLoading(false);
    }
  }

  //! GET TV TOP RATED

  final tvTopRated = <ResultsTV>[].obs;
  getTVTopRated(page) async {
    isLoading(true);
    try {
      var topRated = await dashboardInteractor.handleTVTopRated(page);

      topRated?.forEach((element) => tvTopRated.add(element));
    } catch (e) {
      debugPrint(" Error Get TV Top Rated : $e");
    } finally {
      isLoading(false);
    }
  }
}
