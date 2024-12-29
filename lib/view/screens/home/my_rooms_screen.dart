import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/home_controller.dart';

import '../../../controller/room_controller.dart';
import '../../../controller/user_controller.dart';
import '../../base/room/room_list_item.dart';
import '../../widgets/paginated_list_widget.dart';
import '../rooms/create_room_screen.dart';

class MyRoomsScreen extends StatefulWidget {
  const MyRoomsScreen({super.key});

  @override
  State<MyRoomsScreen> createState() => _MyRoomsScreenState();
}

class _MyRoomsScreenState extends State<MyRoomsScreen>
    with TickerProviderStateMixin {
  final ScrollController _recentScrollController = ScrollController();
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          SizedBox(
            height: 90,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Get.find<UserController>().userModel?.ownRoom == null
                ? InkWell(
                    onTap: () {
                      if (Get.find<UserController>().userModel?.ownRoom !=
                          null) {
                        Get.find<RoomController>().joinRoom(
                            Get.find<UserController>().userModel!.ownRoom!);
                      } else {
                        Get.to(CreateRoomScreen());
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              matchTextDirection: true,
                              image: AssetImage(
                                  'assets/images/create_room_button_bg.webp'),
                              fit: BoxFit.fill)),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white70,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'create room'.tr,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white70),
                              ),
                              Text(
                                'create your own room'.tr,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white70),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : RoomListItem(
                    uuid: "${Get.find<UserController>().userModel!.uuid}",
                    room: Get.find<UserController>().userModel!.ownRoom!, userModel:  Get.find<UserController>().userModel!,),
          ),
          SizedBox(
            height: 10,
          ),
          TabBar(
            controller: tabController,
            labelPadding: EdgeInsets.zero,
            tabs: [
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage('assets/images/send_msg_bg.png'),
                        fit: BoxFit.fill),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/images/icon_recent.png',
                        ),
                        width: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Recently'.tr,
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage('assets/images/send_msg_bg.png'),
                        fit: BoxFit.fill),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/images/icon_hot.png',
                        ),
                        width: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'New'.tr,
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage('assets/images/send_msg_bg.png'),
                        fit: BoxFit.fill),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/images/icon_favorite.png',
                        ),
                        width: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Favorite'.tr,
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GetBuilder<HomeController>(
                    builder: (HomeController homeController) {
                      return PaginatedListWidget(
                        scrollController: _recentScrollController,
                        page: homeController.page,
                        isLoading: homeController.isLoading,
                        enabledPagination: true,
                        onPaginate: (int? page) {
                          homeController.paginate(homeController.page + 1);
                        },
                        itemView: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              ...?homeController.homeRooms?.map(
                                (e) => SizedBox(
                                  height: 100,
                                  child: RoomListItem(
                                    room: e, userModel:  Get.find<UserController>().userModel!,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GetBuilder<HomeController>(
                    builder: (HomeController homeController) {
                      return PaginatedListWidget(
                        scrollController: _recentScrollController,
                        page: homeController.page,
                        isLoading: homeController.isLoading,
                        enabledPagination: true,
                        onPaginate: (int? page) {
                          homeController.paginate(homeController.page + 1);
                        },
                        itemView: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              ...?homeController.homeRooms?.map(
                                (e) => Container(
                                  height: 100,
                                  child: RoomListItem(
                                    room: e, userModel:  Get.find<UserController>().userModel!,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GetBuilder<HomeController>(
                    builder: (HomeController homeController) {
                      return PaginatedListWidget(
                        scrollController: _recentScrollController,
                        page: homeController.page,
                        isLoading: homeController.isLoading,
                        enabledPagination: true,
                        onPaginate: (int? page) {
                          homeController.paginate(homeController.page + 1);
                        },
                        itemView: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              ...?homeController.homeRooms?.map(
                                (e) => Container(
                                  height: 100,
                                  child: RoomListItem(
                                    room: e, userModel:  Get.find<UserController>().userModel!,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
