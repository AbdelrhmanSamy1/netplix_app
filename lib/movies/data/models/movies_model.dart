import 'package:netplix_app/movies/domain/entities/movie.dart';

class MoviesModel extends Movie{
  const MoviesModel({
    required int id,
    required String title,
    required String backdropPath,
    required List<int> genreIds,
    required double voteAverage,
    required String overviews,
    required String releaseDate,
  }) : super(id: id, title: title, backdropPath: backdropPath, genreIds: genreIds, overviews: overviews, voteAverage: voteAverage, releaseDate: releaseDate);

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      MoviesModel(id: json['id'],
          title: json['title'],
          backdropPath: json['backdrop_path'],
          genreIds: List<int>.from(json['genreIds'].map((e) => e)),
          overviews: json['overviews'],
          voteAverage: json['voteAverage'].toDouble,
          releaseDate: json['releaseData'],
      );
}
