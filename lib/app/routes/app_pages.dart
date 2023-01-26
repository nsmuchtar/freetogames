import 'package:freetogames_dio_flutter/pages/sort_dialog.dart';
import 'package:get/get.dart';

import 'package:freetogames_dio_flutter/app/modules/detail_games/bindings/detail_games_binding.dart';
import 'package:freetogames_dio_flutter/app/modules/detail_games/views/detail_games_view.dart';
import 'package:freetogames_dio_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:freetogames_dio_flutter/app/modules/home/views/home_view.dart';
import 'package:freetogames_dio_flutter/app/modules/list_game/bindings/list_game_binding.dart';
import 'package:freetogames_dio_flutter/app/modules/list_game/views/list_game_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LIST_GAME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LIST_GAME,
      page: () => ListGameView(),
      binding: ListGameBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_GAMES,
      page: () => DetailGamesView(),
      binding: DetailGamesBinding(),
    ),
    GetPage(
      name: _Paths.SORT_DIALOG,
      page: () => SortDialog(),
      binding: DetailGamesBinding(),
    ),
  ];
}
