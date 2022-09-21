import 'package:movie_app/core/domain/entity/entity.dart';

extension MovieDto on MovieEntity {
  static MovieEntity fromJson(Map<String, dynamic> json) {
    List<int> genreIDs = [];

    if (json['genre_ids'] != null) {
      for (var id in json['genre_ids']) {
        genreIDs.add(id);
      }
    }

    return MovieEntity(
      genreIDs: genreIDs,
      id: json['id'],
      imagePath: json['poster_path'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      title: json['title'],
      rate: json['vote_average']?.todouble(),
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
