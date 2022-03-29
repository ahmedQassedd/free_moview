class MoviesModel {
  late List<Results>? results;

  MoviesModel.json(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((element) {
        results!.add(Results.json(element));
      });
    }
  }
}

class Results {
  dynamic backdropPath;
  dynamic id;
  dynamic originalLanguage;
  dynamic overview;
  dynamic popularity;
  dynamic posterPath;
  dynamic releaseDate;
  dynamic title;
  dynamic voteAverage;
  dynamic voteCount;

  Results.json(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalLanguage = json['original_language'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
