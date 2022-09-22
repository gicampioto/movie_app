import 'package:movie_app/core/domain/entity/movie_entity.dart';

extension MovieDto on MovieEntity {
  static MovieEntity fromJson(Map<String, dynamic> json) {
    List<int> genreIDs = [];

    if (json['genre_ids'] != null) {
      for (var id in json['genre_ids']) {
        genreIDs.add(id);
      }
    }

    return MovieEntity(
      id: json['id'],
      title: json['title'],
      overview: json['overview'] ?? 'Não possui sinopse em português.',
      releaseDate: json['release_date'] != null
          ? DateTime.parse(json['release_date'])
          : null,
      rate: json['vote_average']?.toDouble(),
      genreIDs: genreIDs,
      imagePath: json['poster_path'],
      videoPath: json['key'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'genre_ids': genreIDs,
      'id': id,
      'poster_path': imagePath,
      'overview': overview,
      'release_date': releaseDate,
      'title': title,
      'vote_average': rate,
      'key': videoPath,
    };
  }
}
