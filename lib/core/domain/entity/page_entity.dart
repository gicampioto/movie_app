import 'movie_entity.dart';

class PageEntity {
  String currentPage;
  int totalPages;
  List<MovieEntity> movies;

  PageEntity({
    required this.currentPage,
    required this.totalPages,
    required this.movies,
  });
}
