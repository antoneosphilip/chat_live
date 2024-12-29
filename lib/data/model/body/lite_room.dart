class LiteRoom {
  int? id;
  String? name;
  String? cover;

  LiteRoom({this.id, this.name, this.cover});

  LiteRoom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cover = json['cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cover'] = cover;
    return data;
  }
}
