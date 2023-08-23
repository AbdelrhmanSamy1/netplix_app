import 'package:get_it/get_it.dart';
import 'package:netplix_app/movies/data/datasources/movie_remote.dart';
import 'package:netplix_app/movies/data/repository/movies_repo.dart';
import 'package:netplix_app/movies/domain/repository/base_movie_repository.dart';
import 'package:netplix_app/movies/domain/usecases/get_Now_playing_movies.dart';
import 'package:netplix_app/movies/presentation/controller/movies_bloc.dart';

import '../../movies/domain/usecases/get_Popular_movies.dart';
import '../../movies/domain/usecases/get_Top_rated_movies.dart';
import '../../movies/domain/usecases/get_movie_details.dart';
import '../../movies/presentation/controller/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator{

  void init() {
    ///Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),));

    ///use cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));

    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));

    ///Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }

}