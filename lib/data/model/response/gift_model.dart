class GiftModel {
  int? id;
  String? name;
  String? price;
  int? points;
  int? vipLevel;
  String? thumbnail;
  String? image;
  int? type;
  int? status;
  int? broadcastingStatus;
  bool? isLocked;

  GiftModel({
    this.id,
    this.name,
    this.price,
    this.points,
    this.vipLevel,
    this.thumbnail,
    this.image,
    this.type,
    this.status,
    this.broadcastingStatus,
    this.isLocked,
  });

  GiftModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    points = json['points'];
    vipLevel = json['vip_level'];
    thumbnail = json['thumbnail'];
    image = json['image'];
    type = json['type'];
    status = json['status'];
    broadcastingStatus = json['broadcasting_status'];
    isLocked = json['vip_lock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['points'] = this.points;
    data['vip_level'] = this.vipLevel;
    data['thumbnail'] = this.thumbnail;
    data['image'] = this.image;
    data['type'] = this.type;
    data['status'] = this.status;
    data['broadcasting_status'] = this.broadcastingStatus;
    data['vip_lock'] = this.isLocked;
    return data;
  }
}
