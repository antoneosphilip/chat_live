import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/auth_controller.dart';
import 'package:live_app/helper/responsive_helper.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/view/base/custom_app_bar.dart';
import 'package:live_app/view/base/custom_button.dart';
import 'package:live_app/view/base/custom_snackbar.dart';
import 'package:live_app/view/screens/search/widget/search_field.dart';
import 'package:live_app/view/screens/search/widget/search_result_widget.dart';

import '../../../controller/searching_controller.dart';

class SearchScreen extends StatefulWidget {
  final String? queryText;
  const SearchScreen({Key? key, required this.queryText}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  final TextEditingController _searchController = TextEditingController();
  late bool _isLoggedIn;

  @override
  void initState() {
    super.initState();
    Get.put(MySearchController());
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    _isLoggedIn = Get.find<AuthController>().isLoggedIn();

    Get.find<MySearchController>().getHistoryList();
    if (widget.queryText!.isNotEmpty) {
      _actionSearch(true, widget.queryText, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Get.find<MySearchController>().isSearchMode) {
          return true;
        } else {
          Get.find<MySearchController>().setSearchMode(true);
          return false;
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'search'.tr,
        ),
        // endDrawer: const MenuDrawer(),
        // endDrawerEnableOpenDragGesture: false,
        body: SafeArea(
            child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
          child: GetBuilder<MySearchController>(builder: (searchController) {
            _searchController.text = searchController.searchText!;
            return Column(children: [
              widget.queryText!.isNotEmpty
                  ? const SizedBox()
                  : Center(
                      child: ResponsiveHelper.isDesktop(context)
                          ? const SizedBox()
                          : SizedBox(
                              width: Dimensions.webMaxWidth,
                              child: Row(children: [
                                const SizedBox(
                                    width: Dimensions.paddingSizeSmall),
                                Expanded(
                                    child: SearchField(
                                  controller: _searchController,
                                  hint: 'search_rooms'.tr,
                                  suffixIcon: !searchController.isSearchMode
                                      ? Icons.filter_list
                                      : Icons.search,
                                  iconPressed: () => _actionSearch(false,
                                      _searchController.text.trim(), false),
                                  onSubmit: (text) => _actionSearch(true,
                                      _searchController.text.trim(), false),
                                )),
                                CustomButton(
                                  onPressed: () {
                                    if (searchController.isSearchMode) {
                                      Get.back();
                                    } else {
                                      searchController.setSearchMode(true);
                                    }
                                  },
                                  buttonText: 'cancel'.tr,
                                  transparent: true,
                                  width: 80,
                                ),
                              ]))),
              Expanded(
                  child: searchController.isSearchMode
                      ? SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSizeSmall),
                        )
                      : SearchResultWidget(
                          searchText: _searchController.text.trim(),
                          tabController: null)),
            ]);
          }),
        )),
      ),
    );
  }

  void searchData() {
    if (_searchController.text.trim().isEmpty) {
      showCustomSnackBar('search_rooms_or_users'.tr);
    } else {
      _actionSearch(true, _searchController.text, true);
    }
  }

  void _actionSearch(bool isSubmit, String? queryText, bool fromHome) {
    if (Get.find<MySearchController>().isSearchMode || isSubmit) {
      if (queryText!.isNotEmpty) {
        Get.find<MySearchController>().searchData(queryText, fromHome);
      } else {
        showCustomSnackBar('search_rooms_or_users'.tr);
      }
    }
  }
}
