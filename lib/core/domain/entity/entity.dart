class MovieEntity {
  List<int> genreIDs;
  int id;
  String imagePath;
  String overview;
  double? rate;
  DateTime releaseDate;
  String title;
  String? videoPath;

  MovieEntity({
    required this.genreIDs,
    required this.id,
    required this.imagePath,
    required this.overview,
    required this.rate,
    required this.releaseDate,
    required this.title,
    required this.videoPath,
  });
}
