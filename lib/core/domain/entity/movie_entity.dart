class MovieEntity {
  int? id;
  String? title;
  String? overview;
  double? rate;
  DateTime? releaseDate;
  List<int> genreIDs;
  String? imagePath;
  String? videoPath;

  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.rate,
    required this.releaseDate,
    required this.genreIDs,
    required this.imagePath,
    required this.videoPath,
  });

  @override
  String toString() {
    return 'id: $id, title: $title, overview: $overview, rate: $rate, date: $releaseDate';
  }
}
