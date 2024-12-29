class GetBackGroundModel {
  bool? success;
  int ?status;
  String? message;
  List<BackGroundItems>? backGroundList;

  GetBackGroundModel({this.success, this.status, this.message, this.backGroundList});

  GetBackGroundModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      backGroundList=[];
      json['data'].forEach((v) {
        backGroundList?.add(new BackGroundItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.backGroundList != null) {
      data['data'] = this.backGroundList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BackGroundItems {
  int ?id;
  String? image;
  String? thumbnail;
  String? price;

  BackGroundItems({this.id, this.image, this.thumbnail, this.price});

  BackGroundItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['thumbnail'] = this.thumbnail;
    data['price'] = this.price;
    return data;
  }
}