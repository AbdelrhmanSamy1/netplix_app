import 'package:dartz/dartz.dart';
import 'package:netplix_app/core/error/failure.dart';
import 'package:netplix_app/movies/data/datasources/movie_remote.dart';
import 'package:netplix_app/movies/domain/entities/movie_details.dart';
import 'package:netplix_app/movies/domain/entities/recommendation.dart';
import 'package:netplix_app/movies/domain/usecases/get_movie_details.dart';
import 'package:netplix_app/movies/domain/usecases/get_recommendation_usecase.dart';

import '../entities/movie.dart';

abstract class BaseMoviesRepository{

  Future <Either<Failure , List<Movie>>> getNowPlayingMovies();

  Future <Either<Failure , List<Movie>>> getPopularMovies();

  Future <Either<Failure , List<Movie>>> getTopRatedMovies();

  Future <Either<Failure , MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);
  Future <Either<Failure , List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters
      );
}