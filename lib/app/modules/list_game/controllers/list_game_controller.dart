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
  var sorts = <Games>[].obs;
  var genre = 'Shooter'.obs;
  var platform = 'All'.obs;
  var sortBy = 'Release Date'.obs;
  List<String> listGenre = [];
  RxBool isVisible = false.obs;
  Dio dio = Dio();
  @override
  void onInit() {
    getList();
    getListGenre();
    showFilter();
    super.onInit();
    // final List<String> list = genre.toList();
    // print(list);
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void showFilter() {
    if (isVisible.isTrue) {
      isVisible.value = true;
    } else {
      isVisible.value = false;
    }
  }

  Future<List<Games>> getList() async {
    isLoading(true);
    try {
      final result = await ApiClient().getData(ApiConst.listGames);
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

  Future<List<Games>> getListByGenre(String genre) async {
    isLoading(true);
    try {
      final result = await ApiClient().getData(ApiConst.sortByGenre(genre));
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

  Future<List<String?>> getListGenre() async {
    isLoading(true);
    try {
      final result = await ApiClient().getData(ApiConst.listGames);
      final List data = result;
      isLoading(false);
      isError(false);
      final Set<String> genres =
          data.map((e) => Games.fromJson(e).genre!).toSet();
      listGenre = genres.toList();
      return listGenre;
    } catch (e) {
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }

  Future<List<Games>> resetSort() async {
    genre.value = 'Shooter';
    platform.value = 'All';
    sortBy.value = 'Release Date';
    print(sortBy.value);
    isLoading(true);
    try {
      final result = await ApiClient().getData(ApiConst.listGames);
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

  Future<List<Games>> sorting() async {
    isLoading(true);
    try {
      final result = await ApiClient().getData(
        ApiConst.sorting(
          genre.value.toLowerCase(),
          sortBy.value.toString().replaceAll(' ', '-'),
          platform.value.toLowerCase(),
        ),
      );
      final List data = result;
      isLoading(false);
      isError(false);
      games.value = data.map((e) => Games.fromJson(e)).toList();
      return sorts;
    } catch (e) {
      print(e);
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }
}
