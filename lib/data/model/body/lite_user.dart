class LiteUser {
  int? id;
  int? uuid;
  String? name;
  String? image;

  LiteUser({this.id, this.uuid, this.name, this.image});

  LiteUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
