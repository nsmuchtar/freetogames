import 'package:get/get.dart';

import '../controllers/detail_games_controller.dart';

class DetailGamesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailGamesController>(
      () => DetailGamesController(),
    );
  }
}
