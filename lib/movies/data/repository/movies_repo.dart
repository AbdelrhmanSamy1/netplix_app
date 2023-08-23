import 'package:dartz/dartz.dart';
import 'package:netplix_app/core/error/exception.dart';
import 'package:netplix_app/core/error/failure.dart';
import 'package:netplix_app/movies/data/datasources/movie_remote.dart';
import 'package:netplix_app/movies/domain/entities/movie.dart';
import 'package:netplix_app/movies/domain/entities/movie_details.dart';
import 'package:netplix_app/movies/domain/entities/recommendation.dart';
import 'package:netplix_app/movies/domain/repository/base_movie_repository.dart';
import 'package:netplix_app/movies/domain/usecases/get_movie_details.dart';
import 'package:netplix_app/movies/domain/usecases/get_recommendation_usecase.dart';
import '../../../core/error/exception.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getMoviesDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }  }

  @override
  Future<Either<Failure, List<Recommendation>>>
  getRecommendation(RecommendationParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }  }
}