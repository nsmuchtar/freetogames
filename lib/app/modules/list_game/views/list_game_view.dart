import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:freetogames_dio_flutter/app/routes/app_pages.dart';
import 'package:freetogames_dio_flutter/pages/sort_dialog.dart';
import 'package:get/get.dart';
import '../controllers/list_game_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListGameView extends GetView<ListGameController> {
  const ListGameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ListGameController _controller = Get.put(ListGameController());
    Widget header() {
      return Row(
        children: [
          Flexible(
            child: TextField(
              style: TextStyle(
                color: Color(0xffaaaaaa),
                fontSize: 15,
              ),
              decoration: InputDecoration(
                fillColor: Color(0xffaaaaaa),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                  color: Color(0xffaaaaaa),
                ),
                focusColor: Color(0xffaaaaaa),
              ),
            ),
          ),
          SizedBox(
            width: 30.w,
          ),
          IconButton(
            onPressed: () {
              _controller.isVisible.value = !_controller.isVisible.value;
            },
            icon: Icon(
              Icons.format_align_justify,
              color: Color(0xffaaaaaa),
            ),
          )
        ],
      );
    }

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
            return Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _controller.games.length,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: GestureDetector(
                                            onTap: () {
                                              _controller.getListByGenre(
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
              ),
            );
        },
      );
    }

    Widget filter() {
      return Obx(() => Visibility(
            visible: _controller.isVisible.value,
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Color(0xffaaaaaa),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 180.h,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    // Obx(
                    //   () {
                    //     return DropdownButton(
                    //       hint: Text(
                    //         'Choose Genre',
                    //         style: TextStyle(
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    //       items: [],
                    //       onChanged: ((value) {}),
                    //     );
                    //   },
                    // )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Sort By',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SortDialog())!.then((value) {
                          _controller.selectSort(value);
                        });
                      },
                      child: Container(
                        width: 150.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff32383e),
                        ),
                        child: Obx(
                          () => Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              _controller.sortBy.value,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     OutlinedButton(
                    //       style: ButtonStyle(
                    //         backgroundColor:
                    //             MaterialStatePropertyAll<Color>(Colors.red),
                    //       ),
                    //       onPressed: () {},
                    //       child: Text(
                    //         'Reset',
                    //         style: TextStyle(
                    //           color: Color(0xff272b30),
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       height: 10.h,
                    //       width: 20.w,
                    //     ),
                    //     OutlinedButton(
                    //       style: ButtonStyle(
                    //         backgroundColor:
                    //             MaterialStatePropertyAll<Color>(Colors.blue),
                    //       ),
                    //       onPressed: () {},
                    //       child: Text(
                    //         'Apply',
                    //         style: TextStyle(
                    //           color: Color(0xff272b30),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ]),
            ),
          ));
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff272b30),
        body: Container(
          margin: EdgeInsets.only(
            top: 20,
            right: 5,
            left: 5,
          ),
          child: Column(
            children: [
              header(),
              SizedBox(height: 10.h),
              filter(),
              SizedBox(height: 10.h),
              cardGame()
            ],
          ),
        ),
      ),
    );
  }
}
