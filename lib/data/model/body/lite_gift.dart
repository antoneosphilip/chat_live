class LiteGift {
  int? id;
  int? price;
  String? name;
  String? image;
  String? number;

  LiteGift({this.id, this.price, this.name, this.image});

  LiteGift.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['uuid'];
    name = json['name'];
    image = json['image'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['name'] = name;
    data['image'] = image;
    data['number'] = number;
    return data;
  }
}
