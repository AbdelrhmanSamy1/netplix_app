import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netplix_app/movies/domain/usecases/get_movie_details.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/movie_details.dart';
part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  FutureOr<void> _getMovieDetailsEvent(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(MovieDetailsParameters(
      movieId: event.id,
    ));

    result.fold(
        (l) => emit(state.copyWith(
              movieDetailsState: RequestState.error,
              movieDetailsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetail: r,
              movieDetailsState: RequestState.loaded,
            )));
  }
}
