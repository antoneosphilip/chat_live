import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../controller/my_bag_controller.dart';
import '../../../../util/app_constants.dart';

class BageTopContainer extends StatelessWidget {
  final  MyBagController  myBagController;
  const BageTopContainer({super.key, required this.myBagController});

  @override
  Widget build(BuildContext context) {
    return   Container(
      color: Colors.black12,
      height:
      MediaQuery.of(context).size.height *
          0.06,
      child: TabBar(
          isScrollable: true,
          indicator: BoxDecoration(
              color: Colors.black38,
              borderRadius:
              BorderRadius.circular(30)),
          controller:
          myBagController.tabController,
          tabs: [
            ...myBagController.typesListStatic
                .map((e) => Container(
              child: Row(
                children: [
                  e.image != null
                      ? Image(
                    image: NetworkImage(
                        // ${AppConstants.baseUrl}/
                        "${e.image}"),
                    width: 20,
                    height: 20,
                  )
                      : SizedBox(),
                  Text(
                    '${e.name}',
                    style: const TextStyle(
                        color: Colors
                            .white),
                  ),
                ],
              ),
            ))
          ]),
    );
  }
}
