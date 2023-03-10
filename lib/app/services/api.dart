class ApiConst {
  ApiConst._();

  static const String baseUrl = "https://www.freetogame.com/api/";
  static const String listGames = "games";
  static String listByGenres(String genre) => "games?category=$genre";
  static String detailGames(String id) => "game?id=$id";
}
