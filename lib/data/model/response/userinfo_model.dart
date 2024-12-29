import 'package:live_app/data/model/response/conversation_model.dart';

class UserInfoModel {
  int? id;
  int? uuid;
  String? fName;
  String? lName;
  String? email;
  String? image;
  String? phone;
  String? createdAt;
  String? password;
  int? memberSinceDays;
  double? walletBalance;
  int? loyaltyPoint;
  String? refCode;
  String? socialId;
  bool? hasRoom;
  User? userInfo;

  UserInfoModel(
      {this.id,
      this.uuid,
      this.fName,
      this.lName,
      this.email,
      this.image,
      this.phone,
      this.createdAt,
      this.password,
      this.memberSinceDays,
      this.walletBalance,
      this.loyaltyPoint,
      this.refCode,
      this.socialId,
      this.hasRoom,
      this.userInfo});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    fName = json['f_name'];
    lName = json['l_name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    createdAt = json['created_at'];
    password = json['password'];
    memberSinceDays = json['member_since_days'];
    walletBalance = json['wallet_balance'].toDouble();
    loyaltyPoint = json['loyalty_point'];
    refCode = json['ref_code'];
    socialId = json['social_id'];
    hasRoom = json['has_room'];
    userInfo =
        json['userinfo'] != null ? User.fromJson(json['userinfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['f_name'] = fName;
    data['l_name'] = lName;
    data['email'] = email;
    data['image'] = image;
    data['phone'] = phone;
    data['created_at'] = createdAt;
    data['password'] = password;
    data['member_since_days'] = memberSinceDays;
    data['wallet_balance'] = walletBalance;
    data['loyalty_point'] = loyaltyPoint;
    data['ref_code'] = refCode;
    data['social_id'] = socialId;
    data['has_room'] = hasRoom;
    if (userInfo != null) {
      data['user`info'] = userInfo!.toJson();
    }
    return data;
  }
}
