import 'package:freetogames_dio_flutter/app/models/games.dart';
import 'package:get/get.dart';
import '../../../services/api.dart';
import '../../../services/games_repository.dart';
import 'package:dio/dio.dart';

class ListGameController extends GetxController {
  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = "".obs;
  var games = <Games>[].obs;

  Dio dio = Dio();

  final count = 0.obs;
  @override
  void onInit() {
    getList();
    super.onInit();
  }

  @override
  void onClose() {}

  Future<List<Games>> getList() async {
    isLoading(true);
    try {
      final result = await ApiClient().getData(ApiConst.listGames);
      final List data = result;
      isLoading(false);
      isError(false);
      games.value = data.map((e) => Games.fromJson(e)).toList();
      print(games);
      return games;
    } catch (e) {
      print(e);
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }

  Future<List<Games>> getListbyGenre(String genre) async {
    isLoading(true);
    try {
      final result = await ApiClient().getData(ApiConst.listByGenres(genre));
      final List data = result;
      isLoading(false);
      isError(false);
      games.value = data.map((e) => Games.fromJson(e)).toList();
      return games;
    } catch (e) {
      print(e);
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }
}
