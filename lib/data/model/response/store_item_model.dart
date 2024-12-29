class StoreItemModel {
  int? id;
  String? name;
  int? price;
  String? thumbnail;
  String? image;
  String? svg;
  String? color;
  String? type;
  String? duration;

  StoreItemModel(
      {this.id,
      this.name,
      this.price,
      this.thumbnail,
      this.image,
      this.svg,
      this.color,
      this.type,
      this.duration});

  StoreItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    thumbnail = json['thumbnail'];
    image = json['image'];
    svg = json['svg'];
    color = json['color'];
    type = json['type'];
    duration = json['duration'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['thumbnail'] = this.thumbnail;
    data['image'] = this.image;
    data['svg'] = this.svg;
    data['color'] = this.color;
    data['type'] = this.type;
    data['duration'] = this.duration;
    return data;
  }
}
