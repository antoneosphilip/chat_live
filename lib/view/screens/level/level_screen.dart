import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/level_controller.dart';
import 'package:live_app/util/app_constants.dart';

import '../../../controller/user_controller.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({super.key});
  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    LevelController con = Get.put(LevelController());
    con.setCurrentType('sender');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<LevelController>(
        builder: (controller) {
          List<TableRow> senderTableRows = [];
          List<TableRow> consigneeTableRows = [];
          controller.senderLevelListStatic.forEach(
            (element) {
              senderTableRows.add(
                TableRow(
                  children: [
                    TableCell(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${element.title}",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black38),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            '${AppConstants.baseUrl}/${element.image}',
                            height: 20,
                            width: 60,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/reward.webp',
                              height: 50,
                              width: 50,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '30 ${'days'.tr}',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black38),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
          controller.consigneeLevelList.forEach(
            (element) {
              consigneeTableRows.add(
                TableRow(
                  children: [
                    TableCell(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${element.title}",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black38),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            '${AppConstants.baseUrl}/${element.image}',
                            height: 20,
                            width: 60,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/reward.webp',
                              height: 50,
                              width: 50,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '30 ${'days'.tr}',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black38),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
          return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                toolbarHeight: 60,
                centerTitle: true,
                leading: InkWell(
                  child: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                title: TabBar(
                  controller: tabController,
                  tabs: [
                    Tab(
                      text: 'Wealth Level'.tr,
                    ),
                    Tab(
                      text: 'Charm Level'.tr,
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                controller: tabController,
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.35,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/sender_level_bg.webp'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Expanded(child: Container())
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 60, right: 10, left: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Stack(
                                        children: [
                                          CircleAvatar(
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            backgroundImage: NetworkImage(
                                                "${AppConstants.mediaUrl}/profile/${Get.find<UserController>().userModelStatic?.image}"),
                                          ),
                                          Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/level_no_bg.webp'),
                                            )),
                                            child: Center(
                                              child: Text(
                                                "${'lv'.tr}.${Get.find<UserController>().userModelStatic?.senderLevel?.currentNo}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.blueAccent),
                                              ),
                                            ),
                                          )
                                        ],
                                        alignment: Alignment.bottomCenter,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${'lv'.tr}.${Get.find<UserController>().userModelStatic?.senderLevel?.currentNo}',
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: LinearProgressIndicator(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                value: double.parse(
                                                    "${Get.find<UserController>().userModelStatic?.senderLevel?.value}"),
                                                minHeight:
                                                    12, // Adjust the height of the progress indicator
                                                backgroundColor: Colors
                                                    .grey, // Color of the background
                                                valueColor: AlwaysStoppedAnimation<
                                                        Color>(
                                                    Colors
                                                        .blue), // Color of the progress
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${'lv'.tr}.${Get.find<UserController>().userModelStatic?.senderLevel?.nextNo}',
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Table(
                                  border: TableBorder.all(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black26),
                                  children: [
                                    TableRow(
                                      children: [
                                        TableCell(
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'level'.tr,
                                                style: TextStyle(
                                                    color: Colors.black38),
                                              ),
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                            child: Center(
                                                child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'image'.tr,
                                            style: TextStyle(
                                                color: Colors.black38),
                                          ),
                                        ))),
                                        TableCell(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                'rewards'.tr,
                                                style: TextStyle(
                                                    color: Colors.black38),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ...senderTableRows
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.35,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/consignee_level_bg.webp'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Expanded(child: Container())
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 60, right: 10, left: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Stack(
                                        children: [
                                          CircleAvatar(
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            backgroundImage: NetworkImage(
                                                "${AppConstants.mediaUrl}/profile/${Get.find<UserController>().userModelStatic?.image}"),
                                          ),
                                          Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/level_no_bg.webp'),
                                            )),
                                            child: Center(
                                              child: Text(
                                                "${'lv'.tr}.${Get.find<UserController>().userModelStatic?.consigneeLevel?.currentNo}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.orangeAccent),
                                              ),
                                            ),
                                          )
                                        ],
                                        alignment: Alignment.bottomCenter,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${'lv'.tr}.${Get.find<UserController>().userModelStatic?.consigneeLevel?.currentNo}',
                                            style: TextStyle(
                                                color: Colors.orangeAccent),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: LinearProgressIndicator(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                value: double.parse(
                                                    "${Get.find<UserController>().userModelStatic?.consigneeLevel?.value}"),
                                                minHeight:
                                                    12, // Adjust the height of the progress indicator
                                                backgroundColor: Colors
                                                    .grey, // Color of the background
                                                valueColor: AlwaysStoppedAnimation<
                                                        Color>(
                                                    Colors
                                                        .orangeAccent), // Color of the progress
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${'lv'.tr}.${Get.find<UserController>().userModelStatic?.consigneeLevel?.nextNo}',
                                            style: TextStyle(
                                                color: Colors.orangeAccent),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Table(
                                  border: TableBorder.all(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black26),
                                  children: [
                                    TableRow(
                                      children: [
                                        TableCell(
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'level'.tr,
                                                style: TextStyle(
                                                    color: Colors.black38),
                                              ),
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                            child: Center(
                                                child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'image'.tr,
                                            style: TextStyle(
                                                color: Colors.black38),
                                          ),
                                        ))),
                                        TableCell(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                'rewards'.tr,
                                                style: TextStyle(
                                                    color: Colors.black38),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ...consigneeTableRows
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ));
        },
      ),
    );
  }
}
