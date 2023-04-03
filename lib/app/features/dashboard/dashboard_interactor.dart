import 'package:get/get.dart';
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
import '../tv/models/tv_seasons_details_model.dart';
import '../tv/models/tv_videos_model.dart';
import 'dashboard_worker.dart';

class DashboardInteractor {
  final DashboardWorker dashboardWorker = Get.find();

  //! GET TRANDING MOVIE

  Future<List<Results>?> handleTrandingMovie(media, time) async {
    var tranding = await dashboardWorker.prosesGetTrandingMovie(media, time);

    var movieResponseModel = MovieResponseModel.fromJson(tranding).results;

    return movieResponseModel;
  }

  //! GET DISCOVER MOVIE

  Future<List<Results>?> handleDiscoverMovie(page) async {
    var discover = await dashboardWorker.prosesGetDiscoverMovie(page);

    var movieResponseModel = MovieResponseModel.fromJson(discover).results;

    return movieResponseModel;
  }

  //! GET POPULAR MOVIE

  Future<List<Results>?> handlePopularMovie(page) async {
    var popular = await dashboardWorker.prosesGetPopularMovie(page);

    var movieResponseModel = MovieResponseModel.fromJson(popular).results;

    return movieResponseModel;
  }

  //! GET TOP RATED MOVIE

  Future<List<Results>?> handleTopRatedMovie(page) async {
    var topRated = await dashboardWorker.prosesGetTopRatedMovie(page);

    var movieResponseModel = MovieResponseModel.fromJson(topRated).results;

    return movieResponseModel;
  }

  //! GET SEARCH MOVIE

  Future<List<Results>?> handleSearchMovie(query) async {
    var search = await dashboardWorker.prosesGetSearchMovie(query);

    var movieResponseModel = MovieResponseModel.fromJson(search).results;

    return movieResponseModel;
  }

  //! GET UP COMING MOVIE

  Future<List<ResultsUpComing>?> handleUpComingMovie(page) async {
    var upComing = await dashboardWorker.prosesGetUpComingMovie(page);

    var upComingModel = UpComingModel.fromJson(upComing).results;

    return upComingModel;
  }

  //! GET DETAILS MOVIE

  Future<DetailMovieModel?> handleDetailMovie(id) async {
    var detail = await dashboardWorker.prosesGetDetailMovie(id);

    var detailMovieModel = DetailMovieModel.fromJson(detail)
      ..productionCountries;

    return detailMovieModel;
  }

  //! GET GENRES MOVIE

  Future<List<Genres>?> handleGenreMovie(genreIds) async {
    var genre = await dashboardWorker.prosesGetGenreMovie(genreIds);

    var genreModel = GenreModel.fromJson(genre).genres;

    return genreModel;
  }

  //! GET SIMILAR MOVIE

  Future<List<Results>?> handleSimilarMovie(id) async {
    var similar = await dashboardWorker.prosesGetSimilarMovie(id);

    var movieResponseModel = MovieResponseModel.fromJson(similar).results;

    return movieResponseModel;
  }

  //! GET VIDEOS MOVIE

  Future<VideosModel> handleVideosMovie(id) async {
    var videos = await dashboardWorker.prosesGetVideosMovie(id);

    var videosModel = VideosModel.fromJson(videos);

    return videosModel;
  }

  //! GET CREDITS MOVIE

  Future<CreditMovieModel> handleCreditMovie(id) async {
    var credit = await dashboardWorker.prosesGetCreditMovie(id);

    var creditMovieModel = CreditMovieModel.fromJson(credit);

    return creditMovieModel;
  }

  //! GET IMAGES MOVIE

  Future<ImagesMovieModel?> handleImageMovie(id) async {
    var images = await dashboardWorker.prosesGetImagesMovie(id);

    var imagesModel = ImagesMovieModel.fromJson(images)
      ..backdrops
      ..logos
      ..posters;

    return imagesModel;
  }

  //? GET TV

  //! GET TV RECOMMENDATIONS

  Future<List<ResultsTV>?> handleTVRecommendations(id, page) async {
    var recommendations =
        await dashboardWorker.prosesGetTVRecommendations(id, page);

    var tvResponseModel = TVResponseModel.fromJson(recommendations).results;

    return tvResponseModel;
  }

  //! GET TV DETAILS

  Future<TVDetailsModel?> handleTVDetails(id) async {
    var tvDetails = await dashboardWorker.prosesGetTVDetails(id);

    var tvDetailsModel = TVDetailsModel.fromJson(tvDetails);

    return tvDetailsModel;
  }

  //! GET TV CREDITS

  Future<TVCreditsModel?> handleTVCredits(id) async {
    var tvCredits = await dashboardWorker.prosesGetTVCredits(id);

    var tvCreditsModel = TVCreditsModel.fromJson(tvCredits);

    return tvCreditsModel;
  }

  //! GET TV SIMILAR

  Future<List<ResultsTV>?> handleTVSimilar(id) async {
    var tvSimilar = await dashboardWorker.prosesGetTVSimilar(id);

    var tvResponseModel = TVResponseModel.fromJson(tvSimilar).results;

    return tvResponseModel;
  }

  //! GET TV ON THE AIRING

  Future<List<ResultsTV>?> handleTVOnTheAiring(page) async {
    var tvOnTheAiring = await dashboardWorker.prosesGetTVOnTheAiring(page);

    var tvResponseModel = TVResponseModel.fromJson(tvOnTheAiring).results;

    return tvResponseModel;
  }

  //! GET TV POPULAR

  Future<List<ResultsTV>?> handleTVPopular(page) async {
    var tvPopular = await dashboardWorker.prosesGetTVPopular(page);

    var tvResponseModel = TVResponseModel.fromJson(tvPopular).results;

    return tvResponseModel;
  }
  //! GET TV TOP RATED

  Future<List<ResultsTV>?> handleTVTopRated(page) async {
    var tvTopRated = await dashboardWorker.prosesGetTVTopRated(page);

    var tvResponseModel = TVResponseModel.fromJson(tvTopRated).results;

    return tvResponseModel;
  }
}
