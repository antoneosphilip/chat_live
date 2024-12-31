import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/store_controller.dart';
import '../../../../util/app_constants.dart';
import '../../../../util/images.dart';
import '../../../widgets/loading_idicator.dart';

class ShopContainer extends StatelessWidget {
  final StoreController storeController;

  const ShopContainer({super.key, required this.storeController});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        color: Colors.white70,
        child: Column(
          children: [
            Container(
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
                  storeController.tabController,
                  tabs: [
                    ...storeController.typesListStatic
                        .map((e) => Container(
                      child: Row(
                        children: [
                          e.image != null
                              ? Image(
                            image: NetworkImage(
                                "${AppConstants.baseUrl}/${e.image}"),
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
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              // Use Expanded instead of Flexible
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: storeController.loading
                    ? const LoadingIndicator()
                    : TabBarView(
                  controller: storeController
                      .tabController,
                  children: [
                    ...storeController.typesListStatic
                        .map(
                            (e) =>
                            GridView.builder(
                              itemCount: e
                                  .items
                                  ?.length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                4,
                                crossAxisSpacing:
                                10,
                                mainAxisSpacing:
                                10,
                              ),
                              itemBuilder:
                                  (BuildContext
                              context,
                                  int index) {
                                return Stack(
                                  children: [
                                    InkWell(
                                      onTap:
                                          () {
                                        storeController
                                            .setSelectedItem(e.items![index]);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: storeController.selectedItem?.id == e.items?[index].id ? Colors.yellow : Colors.blueGrey,
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Text(
                                                  "${e.items?[index].duration}",
                                                  style: TextStyle(color: Colors.teal, fontSize: 10),
                                                ),
                                              ),
                                              Container(
                                                width: 35,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    // ${AppConstants.baseUrl}/
                                                    image: NetworkImage("${e.items?[index].thumbnail}"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                                                    child: Text(
                                                      '${e.items?[index].price}',
                                                      style: TextStyle(color: Colors.blue, fontSize: 10),
                                                    ),
                                                  ),
                                                  const Image(
                                                    image: AssetImage(Images.smallRoomDiamondIcon),
                                                    width: 15,
                                                    height: 15,
                                                  )
                                                ],
                                              )
                                            ],
                                          )),
                                    ),
                                  ],
                                );
                              },
                            ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
