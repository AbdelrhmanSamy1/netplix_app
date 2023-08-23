class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";

  static const String apiKey = "72643c464fe33ab258099f31ee217547";

  static const String nowPlayingMoviesPath = "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String popularMoviesPath = "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topMoviesPath = "$baseUrl/movie/top_rated?api_key=$apiKey";

  static  String movieDetailsPath(int movieId) => "$baseUrl/movie/$movieId?api_key=$apiKey";

  static  String recommendationPath(int movieId) => "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path)=> '$baseImageUrl$path';


}