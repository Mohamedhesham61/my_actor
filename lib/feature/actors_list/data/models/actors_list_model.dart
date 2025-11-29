class ActorsListModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  ActorsListModel({this.page, this.results, this.totalPages, this.totalResults});

  factory ActorsListModel.fromJson(Map<String, dynamic> json) {
    final resultsJson = json['results'] as List<dynamic>?; // ممكن تكون null
    final resultsList = resultsJson != null
        ? resultsJson.map((e) => Results.fromJson(e as Map<String, dynamic>)).toList()
        : <Results>[]; // null تتحول لـ empty list

    return ActorsListModel(page: json['page'] ?? 1, results: resultsList, totalPages: json['total_pages'] ?? 1);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class Results {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  List<KnownFor>? knownFor;

  Results({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.knownFor,
  });

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    if (json['known_for'] != null) {
      knownFor = <KnownFor>[];
      json['known_for'].forEach((v) {
        knownFor!.add(KnownFor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    if (knownFor != null) {
      data['known_for'] = knownFor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KnownFor {
  bool? adult;
  String? backdropPath;
  int? id;
  String? name;
  String? originalName;
  String? overview;
  String? posterPath;
  String? mediaType;
  String? originalLanguage;
  List<int>? genreIds;
  double? popularity;
  String? firstAirDate;
  double? voteAverage;
  int? voteCount;
  List<String>? originCountry;
  String? title;
  String? originalTitle;
  String? releaseDate;
  bool? video;

  KnownFor({
    this.adult,
    this.backdropPath,
    this.id,
    this.name,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
    this.title,
    this.originalTitle,
    this.releaseDate,
    this.video,
  });

  KnownFor.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    name = json['name'];
    originalName = json['original_name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    genreIds = (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList() ?? [];
    popularity = (json['popularity'] as num?)?.toDouble();
    firstAirDate = json['first_air_date'];
    voteAverage = (json['vote_average'] as num?)?.toDouble();
    voteCount = json['vote_count'];
    originCountry = (json['origin_country'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [];
    title = json['title'];
    originalTitle = json['original_title'] as String?;
    releaseDate = json['release_date'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['name'] = name;
    data['original_name'] = originalName;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['original_language'] = originalLanguage;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['first_air_date'] = firstAirDate;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['origin_country'] = originCountry;
    data['title'] = title;
    data['original_title'] = originalTitle;
    data['release_date'] = releaseDate;
    data['video'] = video;
    return data;
  }
}
