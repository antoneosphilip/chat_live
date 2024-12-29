import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/data/model/response/store_item_model.dart';

import '../data/api/api_checker.dart';
import '../data/model/response/type_model.dart';
import '../data/repository/my_bag_repo.dart';

class MyBagController extends GetxController
    with GetTickerProviderStateMixin
    implements GetxService {
  final MyBagRepo repo = MyBagRepo();
  late TabController tabController;
  bool loading = false;

  List<TypeModel> typesList = [];
  List<TypeModel> typesListStatic = [
    TypeModel(
      id: 1,
      name: 'Electronics',
      image: 'https://example.com/electronics.png',
      relatedTo: 'Category',
      items: [
        StoreItemModel(
          id: 101,
          name: 'Smartphone',
          price: 999,
          thumbnail: 'https://example.com/smartphone.png',
          image: 'https://example.com/smartphone_image.png',
          svg: 'https://example.com/smartphone.svg',
          color: '#FF5733',
          type: 'Gadget',
          duration: '1 Year',
        ),
        StoreItemModel(
          id: 102,
          name: 'Laptop',
          price: 1500,
          thumbnail: 'https://example.com/laptop.png',
          image: 'https://example.com/laptop_image.png',
          svg: 'https://example.com/laptop.svg',
          color: '#33FF57',
          type: 'Computer',
          duration: '2 Years',
        ),
      ],

    ),
    TypeModel(
      id: 2,
      name: 'Fashion',
      image: 'https://example.com/fashion.png',
      relatedTo: 'Category',
      items: [
        StoreItemModel(
          id: 201,
          name: 'T-Shirt',
          price: 20,
          thumbnail: 'https://example.com/tshirt.png',
          image: 'https://example.com/tshirt_image.png',
          svg: 'https://example.com/tshirt.svg',
          color: '#5733FF',
          type: 'Clothing',
          duration: 'N/A',
        ),
        StoreItemModel(
          id: 202,
          name: 'Jeans',
          price: 50,
          thumbnail: 'https://example.com/jeans.png',
          image: 'https://example.com/jeans_image.png',
          svg: 'https://example.com/jeans.svg',
          color: '#33FFF5',
          type: 'Clothing',
          duration: 'N/A',
        ),
      ],
    ),
  ];

  String? typeRelatedTo;
  List<StoreItemModel> itemsList = [];

  TypeModel? selectedType;
  StoreItemModel? selectedItem;
  StoreItemModel? selectedItemStatic = StoreItemModel(
    id: 1,
    name: 'Smartphone',
    price: 999,
    thumbnail: 'https://example.com/smartphone_thumbnail.png',
    image: 'https://example.com/smartphone_image.png',
    svg: 'https://example.com/smartphone_icon.svg',
    color: '#FF5733',
    type: 'Gadget',
    duration: '1 Year',
  );


  int? currentPage = 1;
  bool isPreview = true;

  Future<void> getTypes() async {
    loading = true;
    update();
    Response response = await repo.getTypesList();
    if (response.statusCode == 200) {
      List<TypeModel> responseList = [];
      response.body['data'].forEach((item) {
        responseList.add(TypeModel.fromJson(item));
      });
      typesList = responseList;
      if (typesList.isNotEmpty) {
        selectedType = typesList[0];
      }
    } else {
      ApiChecker.checkApi(response);
    }
    tabController = TabController(length: typesList.length, vsync: this);
    tabController.addListener(_onTabChanged);
    loading = false;
    update();
  }

  void _onTabChanged() {
    selectedType = typesList[tabController.index];
    itemsList = selectedType!.items!;
  }

  Future<void> getItems(int? typeId) async {
    loading = true;
    update();
    Response response = await repo.getItemsList(selectedType?.id, currentPage);
    if (response.statusCode == 200) {
      List<StoreItemModel> responseList = [];
      response.body['data'].forEach((item) {
        responseList.add(StoreItemModel.fromJson(item));
      });
      itemsList = responseList;
    } else {
      ApiChecker.checkApi(response);
    }
    loading = false;
    update();
  }

  void setSelectedType(TypeModel typeModel) async {
    selectedType = typeModel;
    selectedItem = null;
    await getItems(selectedType?.id);
    update();
  }

  void setSelectedItem(StoreItemModel storeItemModel) {
    selectedItem = storeItemModel;
    isPreview = true;
    update();
  }

  void endPreview() {
    isPreview = false;
    update();
  }
}
