import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:freetogames_dio_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../controllers/list_game_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListGameView extends GetView<ListGameController> {
  const ListGameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ListGameController _controller = Get.put(ListGameController());

    Widget cardGame() {
      return Obx(
        () {
          if (_controller.isLoading.value)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (_controller.isError.value)
            return Center(
              child: Text("Error: ${_controller.errmsg.value.capitalize}"),
            );
          else
            return ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox();
              },
              itemCount: _controller.games.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (() {
                    Get.toNamed(
                      Routes.DETAIL_GAMES,
                      arguments: {'id': _controller.games[index].id},
                    );
                  }),
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 400.h),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 400,
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 10.h,
                            left: 10.w,
                            right: 10.w,
                          ),
                          height: 210,
                          width: double.infinity,
                          color: Color(0xff32383e),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 200.w,
                                    child: Image.network(
                                      '${_controller.games[index].thumbnail}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Flexible(
                                    child: Container(
                                      child: Column(children: [
                                        Text(
                                          '${_controller.games[index].shortDescription}',
                                          overflow: TextOverflow.visible,
                                          maxLines: 6,
                                          style: TextStyle(
                                            color: Color(0xffaaaaaa),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: 200.w,
                                      ),
                                      child: AutoSizeText(
                                        '${_controller.games[index].title}',
                                        style: TextStyle(
                                          color: Color(0xffaaaaaa),
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: GestureDetector(
                                          onTap: () {
                                            _controller.getListbyGenre(
                                                '${_controller.games[index].genre}');
                                          },
                                          child: Text(
                                            '${_controller.games[index].genre}',
                                            style: TextStyle(
                                              color: Color(0xff272b30),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${_controller.games[index].publisher}',
                                style: TextStyle(
                                  color: Color(0xffaaaaaa),
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff272b30),
              ),
            ),
            cardGame()
          ],
        ),
      ),
    );
  }
}
