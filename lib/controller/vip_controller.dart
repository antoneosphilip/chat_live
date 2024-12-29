import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/data/model/response/vip_model.dart';
import 'package:live_app/data/repository/vip_repo.dart';

import '../data/api/api_checker.dart';

class VipController extends GetxController
    with GetTickerProviderStateMixin
    implements GetxService {
  final VipRepo repo = VipRepo();
  late TabController tabController;
  bool isLoading = false;
  List<VipModel> vipList = [];
  List<VipModel> vipListStatic = [
    VipModel(
      id: 1,
      no: 101,
      price: 50,
      thumbnail: "https://example.com/thumbnail1.png",
      image: "https://example.com/image1.png",
      duration: 30,
      activePrivilegesCount: 5,
      allPrivilegesCount: 10,
      privileges: [
        Privileges(
          id: 1,
          name: "Free Shipping",
          title: "Enjoy free shipping on all orders",
          type: "shipping",
          isActive: true,
          thumbnail: "https://example.com/privilege1.png",
          imageType: "png",
          image: "https://example.com/privilege1.png",
          color: "#FF5733",
        ),
        Privileges(
          id: 2,
          name: "Priority Support",
          title: "Get 24/7 priority customer support",
          type: "support",
          isActive: true,
          thumbnail: "https://example.com/privilege2.png",
          imageType: "png",
          image: "https://example.com/privilege2.png",
          color: "#33FF57",
        ),
      ],
    ),
    VipModel(
      id: 2,
      no: 102,
      price: 100,
      thumbnail: "https://example.com/thumbnail2.png",
      image: "https://example.com/image2.png",
      duration: 60,
      activePrivilegesCount: 8,
      allPrivilegesCount: 15,
      privileges: [
        Privileges(

          id: 3,
          name: "Exclusive Deals",
          title: "Access to exclusive deals and offers",
          type: "deals",
          isActive: true,
          thumbnail: "https://example.com/privilege3.png",
          imageType: "png",
          image: "https://example.com/privilege3.png",
          color: "#3357FF",
        ),
      ],
    ),
  ];


  VipModel? selectedVip;
  VipModel? selectedVipStatic=    VipModel(
    id: 1,
    no: 101,
    price: 50,
    thumbnail: "https://example.com/thumbnail1.png",
    image: "https://example.com/image1.png",
    duration: 30,
    activePrivilegesCount: 5,
    allPrivilegesCount: 10,
    privileges: [
      Privileges(
        id: 1,
        name: "Free Shipping",
        title: "Enjoy free shipping on all orders",
        type: "shipping",
        isActive: true,
        thumbnail: "https://example.com/privilege1.png",
        imageType: "png",
        image: "https://example.com/privilege1.png",
        color: "#FF5733",
      ),
      Privileges(
        id: 2,
        name: "Priority Support",
        title: "Get 24/7 priority customer support",
        type: "support",
        isActive: true,
        thumbnail: "https://example.com/privilege2.png",
        imageType: "png",
        image: "https://example.com/privilege2.png",
        color: "#33FF57",
      ),
    ],
  );

  Future<void> getVipList({int? type = 1}) async {
    isLoading = true;
    Response response = await repo.getVipList();
    if (response.statusCode == 200) {
      List<VipModel> newList = [];
      List vipListResponse = response.body['data'];
      for (var item in vipListResponse) {
        var country = VipModel.fromJson(item);
        newList.add(country);
      }
      vipList = newList;
      selectedVip = vipList[0];
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    tabController = TabController(length: vipList.length, vsync: this);
    tabController.addListener(_onTabChanged);
    update();
  }

  void _onTabChanged() {
    selectedVip = vipList[tabController.index];
    update();
  }

  void selectVip(VipModel vip) {
    selectedVip = vip;
    update();
  }
}
