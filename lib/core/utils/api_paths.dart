class ApiPath {
  String baseURL = 'https://api.themoviedb.org/3';
  String apiKey = 'e9e57ba838fed0683d57cb5bec75c105'; //TODO: pegar do .env

  String getByGenre(String genre, String page) {
    return '/discover/movie?api_key=$apiKey&language=pt-BR&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page&with_genres=$genre&with_watch_monetization_types=flatrate';
  }

  String getPopular() {
    return '/movie/popular?api_key=$apiKey&language=pt-BR&page=1';
  }
}
