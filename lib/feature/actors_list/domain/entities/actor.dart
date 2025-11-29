
import 'package:equatable/equatable.dart';

class Actor extends Equatable {
  final int id;
  final String name;
  final String? profilePath;
  final double popularity;

  const Actor({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.popularity,
  });

  @override
  List<Object?> get props => [id, name, profilePath, popularity];
}

class ActorImage extends Equatable {
  final String filePath;
  final double aspectRatio;

  const ActorImage({
    required this.filePath,
    required this.aspectRatio,
  });

  @override
  List<Object?> get props => [filePath, aspectRatio];
}

class ActorDetails extends Equatable {
  final int id;
  final String name;
  final String biography;
  final String birthday;
  final String? deathday;
  final String placeOfBirth;
  final double popularity;
  final String? profilePath;

  const ActorDetails({
    required this.id,
    required this.name,
    required this.biography,
    required this.birthday,
    this.deathday,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    biography,
    birthday,
    deathday,
    placeOfBirth,
    popularity,
    profilePath,
  ];
}

