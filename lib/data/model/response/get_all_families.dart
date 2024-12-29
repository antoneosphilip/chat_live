class GetAllFamilies {
  bool? success;
  int? status;
  String? message;
  List<FamiliesData>? familiesData;

  GetAllFamilies({this.success, this.status, this.message, this.familiesData});

  factory GetAllFamilies.fromJson(Map<String, dynamic> json) {
    return GetAllFamilies(
      success: json['success'],
      status: json['status'],
      message: json['message'],
      familiesData: json['data'] != null
          ? List<FamiliesData>.from(json['data'].map((v) => FamiliesData.fromJson(v)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status': status,
      'message': message,
      'data': familiesData?.map((v) => v.toJson()).toList(),
    };
  }
}

class FamiliesData {
  int? id;
  String? name;
  String? introduce;
  String? notice;
  String? image;
  int? points;
  int? membersCount;

  FamiliesData({
    this.id,
    this.name,
    this.introduce,
    this.notice,
    this.image,
    this.points,
    this.membersCount,
  });

  factory FamiliesData.fromJson(Map<String, dynamic> json) {
    return FamiliesData(
      id: json['id'],
      name: json['name'],
      introduce: json['introduce'],
      notice: json['notice'],
      image: json['image'],
      points: json['points'],
      membersCount: json['members_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'introduce': introduce,
      'notice': notice,
      'image': image,
      'points': points,
      'members_count': membersCount,
    };
  }
}
