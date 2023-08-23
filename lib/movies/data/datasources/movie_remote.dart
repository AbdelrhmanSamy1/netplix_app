import 'package:dio/dio.dart';
import 'package:netplix_app/core/error/exception.dart';
import 'package:netplix_app/core/network/api_constants.dart';
import 'package:netplix_app/core/network/error_msg_model.dart';
import 'package:netplix_app/movies/data/models/movies_model.dart';
import 'package:netplix_app/movies/data/models/recommendation_model.dart';
import 'package:netplix_app/movies/domain/usecases/get_movie_details.dart';
import 'package:netplix_app/movies/domain/usecases/get_recommendation_usecase.dart';

import '../models/movie_details_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();

  Future<List<MoviesModel>> getPopularMovies();
  
  Future<List<MoviesModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {

  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List).map(
            (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List).map(
            (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.topMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List).map(
            (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(
      MovieDetailsParameters parameters) async {
    final response =
    await Dio().get(ApiConstants.movieDetailsPath(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data['result']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters) async {
    final response = await Dio().get(
        ApiConstants.recommendationPath(parameters.id));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
          (response.data['results'] as List).map(
                (e) => MoviesModel.fromJson(e),
          ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}