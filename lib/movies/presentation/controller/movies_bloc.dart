import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netplix_app/core/usecase/base_usecase.dart';
import 'package:netplix_app/core/utils/enums.dart';
import 'package:netplix_app/movies/domain/usecases/get_Now_playing_movies.dart';
import 'package:netplix_app/movies/presentation/controller/movies_events.dart';
import 'package:netplix_app/movies/presentation/controller/movies_states.dart';
import '../../domain/usecases/get_Popular_movies.dart';
import '../../domain/usecases/get_Top_rated_movies.dart';


class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
      this.getNowPlayingMoviesUseCase,
      this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase,
      ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }
}

FutureOr<void>_getNowPlayingMovies(
GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async{
  final result = await getNowPlayingMoviesUseCase(const NoParameters());
  result.fold(
        (l) => emit(state.copyWith(
      nowPlayingState:  RequestState.error,
      popularMessage: l.message,
    )),

        (r) => emit(
      state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded),
    ),
  );
}


FutureOr<void>_getPopularMovies(
    GetPopularMoviesEvent event, Emitter<MoviesState> emit)async {
  final result = await getPopularMoviesUseCase(const NoParameters());

  result.fold(
        (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        )
    ),
        (r) => emit(
      state.copyWith(
        popularMovies: r,
        popularState: RequestState.loaded,
      ),
    ),
  );
}


FutureOr<void> _getTopRatedMovies(
    GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{
  final result = await getTopRatedMoviesUseCase(const NoParameters());
  result.fold((l) => emit(state.copyWith(
    topRatedMessage:l.message,
    topRatedState:RequestState.error
  )), (r) => emit(state.copyWith(
    topRatedMovies: r, topRatedState: RequestState.loaded,
  ),
  ));
}
}

