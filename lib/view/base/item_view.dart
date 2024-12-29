import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/data/model/response/room_model.dart';
import 'package:live_app/data/model/response/user_model.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/view/base/room/room_list_item.dart';
import 'package:live_app/view/widgets/user_list_item.dart';

class ItemsView extends StatefulWidget {
  final List<UserModel>? users;
  final List<RoomModel>? rooms;
  final bool isRoom;
  const ItemsView({Key? key, this.users, this.rooms, required this.isRoom})
      : super(key: key);

  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  @override
  Widget build(BuildContext context) {
    bool isNull = true;
    int length = 0;
    if (widget.isRoom) {
      isNull = widget.rooms == null;
      if (!isNull) {
        length = widget.rooms!.length;
      }
    } else {
      isNull = widget.users == null;
      if (!isNull) {
        length = widget.users!.length;
      }
    }
    List<Widget>? items = [];
    if (widget.isRoom) {
      items = widget.rooms
          ?.map((element) =>
              Container(height: 80, child: RoomListItem(room: element, userModel: Get.find<UserController>().userModel!,)))
          .toList();
    } else {
      items =
          widget.users?.map((element) => UserListItem(user: element)).toList();
    }
    return !isNull
        ? Column(children: [
            SizedBox(
              height: 10,
            ),
            ...?items,
            SizedBox(
              height: 50,
            )
          ])
        : SizedBox();
  }
}

class NewOnShimmerView extends StatelessWidget {
  const NewOnShimmerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Stack(children: [
        Container(
          // width: fromAllStore ?  MediaQuery.of(context).size.width : 260,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          ),
          child: Column(children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radiusDefault),
                    topRight: Radius.circular(Dimensions.radiusDefault)),
                child: Stack(clipBehavior: Clip.none, children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor.withOpacity(0.8),
                      ),
                      child: Icon(Icons.favorite_border,
                          color: Theme.of(context).primaryColor, size: 20),
                    ),
                  ),
                ]),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 95),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: 5,
                              width: 100,
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(children: [
                            const Icon(Icons.location_on_outlined,
                                color: Colors.blue, size: 15),
                            const SizedBox(
                                width: Dimensions.paddingSizeExtraSmall),
                            Expanded(
                              child: Container(
                                height: 10,
                                width: 100,
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                          ]),
                        ]),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeDefault),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 10,
                            width: 70,
                            padding: const EdgeInsets.symmetric(
                                vertical: 3,
                                horizontal: Dimensions.paddingSizeSmall),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radiusLarge),
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 65,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radiusSmall),
                            ),
                          ),
                        ]),
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ]),
    );
  }
}
