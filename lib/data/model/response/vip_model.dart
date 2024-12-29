class VipModel {
  int? id;
  int? no;
  int? price;
  String? thumbnail;
  String? image;
  int? duration;
  int? activePrivilegesCount;
  int? allPrivilegesCount;
  List<Privileges>? privileges;

  VipModel(
      {this.id,
      this.no,
      this.price,
      this.thumbnail,
      this.image,
      this.duration,
      this.activePrivilegesCount,
      this.allPrivilegesCount,
      this.privileges});

  VipModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    no = json['no'];
    price = json['price'];
    thumbnail = json['thumbnail'];
    image = json['image'];
    duration = json['duration'];
    activePrivilegesCount = json['active_privileges_count'];
    allPrivilegesCount = json['all_privileges_count'];
    if (json['privileges'] != null) {
      privileges = <Privileges>[];
      json['privileges'].forEach((v) {
        privileges!.add(new Privileges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['no'] = this.no;
    data['price'] = this.price;
    data['thumbnail'] = this.thumbnail;
    data['image'] = this.image;
    data['duration'] = this.duration;
    data['active_privileges_count'] = this.activePrivilegesCount;
    data['all_privileges_count'] = this.allPrivilegesCount;
    if (this.privileges != null) {
      data['privileges'] = this.privileges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Privileges {
  int? id;
  String? name;
  String? title;
  String? type;
  bool? isActive;
  String? thumbnail;
  String? imageType;
  String? image;
  String? color;

  Privileges(
      {this.id,
      this.name,
      this.title,
      this.type,
      this.isActive,
      this.thumbnail,
      this.imageType,
      this.image,
      this.color});

  Privileges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    type = json['type'];
    isActive = json['is_active'];
    thumbnail = json['thumbnail'];
    imageType = json['image_type'];
    image = json['image'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['type'] = this.type;
    data['is_active'] = this.isActive;
    data['thumbnail'] = this.thumbnail;
    data['image_type'] = this.imageType;
    data['image'] = this.image;
    data['color'] = this.color;
    return data;
  }
}
