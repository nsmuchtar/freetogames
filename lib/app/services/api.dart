class ApiConst {
  ApiConst._();

  static const String baseUrl = "https://www.freetogame.com/api/";
  static const String listGames = "games?sort-by=release-date";
  static String listByGenres(String genre) => "games?category=$genre";
  static String detailGames(String id) => "game?id=$id";
  static String sorting(
    String genre,
    String sortBy,
    String platform,
  ) =>
      "games?platform=$platform&category=$genre&sort-by=$sortBy";
  static String sortByGenre(String genre) => "games?category=$genre";
}
