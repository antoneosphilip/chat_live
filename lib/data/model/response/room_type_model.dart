class RoomTypeModel {
  int? id;
  String? name;
  String? title;
  String? thumbnail;
  String? image;

  RoomTypeModel({this.id, this.name, this.title, this.thumbnail, this.image});

  RoomTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['image'] = this.image;
    return data;
  }
}
