import 'package:netplix_app/movies/data/models/genres_model.dart';
import 'package:netplix_app/movies/domain/entities/genres.dart';
import 'package:netplix_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required String backdropPath,
      required List<Genres> genres,
      required int id,
      required String overview,
      required String releaseDate,
      required int runtime,
      required String title,
      required String voteAverage})
      : super(
            backdropPath: backdropPath,
            genres: genres,
            id: id,
            overview: overview,
            releaseDate: releaseDate,
            runtime: runtime,
            title: title,
            voteAverage: voteAverage);

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => MovieDetailsModel(
      backdropPath: json['backdropPath'],
      genres: List<GenresModel>.from(json['genres'].map((x)=> GenresModel.fromJson(x))),
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average']
  );
}
