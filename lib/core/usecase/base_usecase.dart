import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:netplix_app/core/error/failure.dart';
import 'package:netplix_app/movies/domain/entities/movie.dart';

abstract class BaseUseCase<T , parameters> {
  Future<Either<Failure , T>> call(parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object> get props => [];
}