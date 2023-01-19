import 'package:get/get.dart';

import '../controllers/list_game_controller.dart';

class ListGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListGameController>(
      () => ListGameController(),
    );
  }
}
