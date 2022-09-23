import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiPath {
  String baseURL = 'https://api.themoviedb.org/3';
  String apiKey = dotenv.env['API_KEY']!;

  String getByGenre(String genre, String page) {
    return '/discover/movie?api_key=$apiKey&language=pt-BR&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page&with_genres=$genre&with_watch_monetization_types=flatrate';
  }

  String getPopular() {
    return '/movie/popular?api_key=$apiKey&language=pt-BR&page=1';
  }
}
