import 'package:netplix_app/movies/domain/entities/genres.dart';

class GenresModel extends Genres {
  const GenresModel({required String name, required int id})
      : super(name: name, id: id);

  factory GenresModel.fromJson(Map<String , dynamic> json)=>GenresModel(
      name: json['name'],
      id: json['id'],
  );

}
