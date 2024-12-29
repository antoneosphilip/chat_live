import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/data/model/response/user_model.dart';
import 'package:live_app/view/widgets/user_list_item.dart';

import '../../base/no_data_screen.dart';
import '../../widgets/paginated_list_widget.dart';

class UserListScreen extends StatefulWidget {
  final bool isLoading;
  final List<UserModel> list;
  final int page;
  final Function(int? page) onPaginate;
  const UserListScreen(
      {super.key,
      this.isLoading = false,
      required this.list,
      this.page = 1,
      required this.onPaginate});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: widget.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: widget.list.isNotEmpty
                  ? PaginatedListWidget(
                      scrollController: _scrollController,
                      page: widget.page,
                      isLoading: widget.isLoading,
                      enabledPagination: true,
                      onPaginate: widget.onPaginate,
                      itemView: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        reverse: true,
                        itemCount: widget.list.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: UserListItem(
                              user: widget.list[index],
                            ),
                          );
                        },
                      ),
                    )
                  : NoDataScreen(
                      text: 'no_data'.tr,
                    )),
    );
  }
}
