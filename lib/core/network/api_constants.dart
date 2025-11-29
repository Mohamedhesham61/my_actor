
class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageUrl = 'https://image.tmdb.org/t/p/original';
  static const String apiKey = '5ff20fa594a740a5967d612cc6fdc522';

  static const String actorsList = '$baseUrl/person/popular';

  static String actorDetails(int actorId) => '$baseUrl/person/$actorId';

  static String originalImage(int imagePath) => '$imageUrl$imagePath';

}
