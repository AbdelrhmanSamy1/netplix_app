import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:netplix_app/core/error/failure.dart';
import 'package:netplix_app/core/usecase/base_usecase.dart';
import 'package:netplix_app/movies/domain/entities/movie_details.dart';
import 'package:netplix_app/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, MovieDetailsParameters> {

  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) async{
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends  Equatable{

  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
