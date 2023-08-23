import 'package:netplix_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required String backdropPath, required int id})
      : super(backdropPath: backdropPath, id: id);

  factory RecommendationModel.fromJson(Map<String, dynamic> json)=>
      RecommendationModel(
          backdropPath: json['backdrop_path'],
          id: json['id'],
      );
}
