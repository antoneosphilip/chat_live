import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/searching_controller.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/util/styles.dart';

import 'item_view.dart';

class SearchResultWidget extends StatefulWidget {
  final String searchText;
  final TabController? tabController;
  const SearchResultWidget(
      {Key? key, required this.searchText, this.tabController})
      : super(key: key);

  @override
  SearchResultWidgetState createState() => SearchResultWidgetState();
}

class SearchResultWidgetState extends State<SearchResultWidget>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    if (widget.tabController != null) {
      _tabController = widget.tabController;
    } else {
      _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      GetBuilder<MySearchController>(
        builder: (searchController) {
          bool isNull = true;
          int length = 0;
          if (searchController.isRoom) {
            isNull = searchController.searchRoomList == null;
            if (!isNull) {
              length = searchController.searchRoomList!.length;
            }
          } else {
            isNull = searchController.searchUserList == null;
            if (!isNull) {
              length = searchController.searchUserList!.length;
            }
          }
          return isNull
              ? const SizedBox()
              : Center(
                  child: SizedBox(
                    width: Dimensions.webMaxWidth,
                    child: Padding(
                      padding:
                          const EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Row(
                        children: [
                          Text(
                            length.toString(),
                            style: robotoBold.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: Dimensions.fontSizeSmall),
                          ),
                          const SizedBox(
                              width: Dimensions.paddingSizeExtraSmall),
                          Expanded(
                            child: Text(
                              'results_found'.tr,
                              style: robotoRegular.copyWith(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: Dimensions.fontSizeSmall),
                            ),
                          ),
                          widget.searchText.isNotEmpty
                              ? InkWell(
                                  onTap: () {
                                    List<Widget> rooms = [];
                                    if (!Get.find<MySearchController>()
                                        .isRoom) {}
                                  },
                                  child: const Icon(Icons.filter_list),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
      Center(
          child: Container(
        width: Dimensions.webMaxWidth,
        color: Theme.of(context).cardColor,
        child: TabBar(
          controller: _tabController,
          indicatorColor: Theme.of(context).primaryColor,
          indicatorWeight: 3,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Theme.of(context).disabledColor,
          unselectedLabelStyle: robotoRegular.copyWith(
              color: Theme.of(context).disabledColor,
              fontSize: Dimensions.fontSizeSmall),
          labelStyle: robotoBold.copyWith(
              fontSize: Dimensions.fontSizeSmall,
              color: Theme.of(context).primaryColor),
          tabs: [
            Tab(text: 'user'.tr),
            Tab(text: 'room'.tr),
          ],
        ),
      )),
      Expanded(
          child: NotificationListener(
        onNotification: (dynamic scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            Get.find<MySearchController>().setType(_tabController!.index == 1);
            Get.find<MySearchController>().searchData(widget.searchText, false);
          }
          return false;
        },
        child: TabBarView(
          controller: _tabController,
          children: const [
            ItemView(isRoom: false),
            ItemView(isRoom: true),
          ],
        ),
      )),
    ]);
  }
}
