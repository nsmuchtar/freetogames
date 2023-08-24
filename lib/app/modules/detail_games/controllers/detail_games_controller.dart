import 'dart:developer';

import 'package:freetogames_dio_flutter/app/models/detail_games.dart';
import 'package:get/get.dart';
import '../../../services/api.dart';
import '../../../services/games_repository.dart';

class DetailGamesController extends GetxController {
  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = "".obs;
  var details = DetailGames();
  RxBool isVisible = false.obs;
  int? id;

  final count = 0.obs;

  @override
  void onInit() {
    getArgument();
    getDetail(id!);
    super.onInit();

    if (isVisible.isTrue) {
      isVisible.value = false;
    } else {
      isVisible.value = true;
    }
  }

  @override
  void onReady() {
    print('ini on ready');
    super.onReady();
  }

  @override
  void onClose() {}

  void getArgument() {
    var args = Get.arguments;

    if (args != null) {
      id = args['id'];
    }
  }

  Future getDetail(int id) async {
    isLoading = true.obs;
    try {
      final result =
          await ApiClient().getData(ApiConst.detailGames(id.toString()));
      isLoading(false);
      isError(false);
      details = DetailGames.fromJson(result);
      log(details.minimumSystemRequirements.toString());
      return details;
    } catch (e) {
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }
}
