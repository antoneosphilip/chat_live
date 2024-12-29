import 'package:live_app/data/model/response/store_item_model.dart';

class TypeModel {
  int? id;
  String? name;
  String? image;
  String? relatedTo;
  List<StoreItemModel>? items;

  TypeModel({this.id, this.name, this.image, this.relatedTo,this.items});

  TypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    relatedTo = json['related_to'];
    if (json['items'] != null) {
      items = <StoreItemModel>[];
      json['items'].forEach((item) {
        items!.add(StoreItemModel.fromJson(item));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['related_to'] = this.relatedTo;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
