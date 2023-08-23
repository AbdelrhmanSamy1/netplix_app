import 'package:dartz/dartz.dart';
import 'package:netplix_app/core/error/failure.dart';
import 'package:netplix_app/core/usecase/base_usecase.dart';
import 'package:netplix_app/movies/domain/entities/movie.dart';
import 'package:netplix_app/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie> , NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}