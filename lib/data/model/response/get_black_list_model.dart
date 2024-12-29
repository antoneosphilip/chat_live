class RoomBlackListModel {
  bool? success;
  int? status;
  String? message;
  List<RoomBlackListData>? roomBlackListData;

  RoomBlackListModel({this.success, this.status, this.message, this.roomBlackListData});

  RoomBlackListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      roomBlackListData = <RoomBlackListData>[];
      json['data'].forEach((v) {
        roomBlackListData?.add(RoomBlackListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.roomBlackListData != null) {
      data['data'] = this.roomBlackListData?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RoomBlackListData {
  int? id;
  User? user;
  String? reason;
  String? type;
  String? addedAt;
  String? endAt;

  RoomBlackListData({this.id, this.user, this.reason, this.type, this.addedAt, this.endAt});

  RoomBlackListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    reason = json['reason'];
    type = json['type'];
    addedAt = json['added_at'];
    endAt = json['end_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    data['reason'] = reason;
    data['type'] = type;
    data['added_at'] = addedAt;
    data['end_at'] = endAt;
    return data;
  }
}

class User {
  int? id;
  int? uuid;
  String? name;
  String? gender;
  String? pio;
  String? image;
  Country? country;
  double? balance;
  int? friendsCount;
  int? friendRequestsCount;
  int? followersCount;
  int? followingsCount;
  int? visitorsCount;
  int? newVisitsCount;
  bool? isFollowed;
  bool? isFriend;
  bool? amISentFriendRequest;
  bool? isHeSentFriendRequest;
  OwnRoom? ownRoom;
  dynamic inRoom;
  Wallet? wallet;
  Level? senderLevel;
  Level? consigneeLevel;
  String? time;

  User({
    this.id,
    this.uuid,
    this.name,
    this.gender,
    this.pio,
    this.image,
    this.country,
    this.balance,
    this.friendsCount,
    this.friendRequestsCount,
    this.followersCount,
    this.followingsCount,
    this.visitorsCount,
    this.newVisitsCount,
    this.isFollowed,
    this.isFriend,
    this.amISentFriendRequest,
    this.isHeSentFriendRequest,
    this.ownRoom,
    this.inRoom,
    this.wallet,
    this.senderLevel,
    this.consigneeLevel,
    this.time,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    gender = json['gender'];
    pio = json['pio'];
    image = json['image'];
    country = json['country'] != null ? Country.fromJson(json['country']) : null;
    balance = json['balance']?.toDouble();
    friendsCount = json['friends_count'];
    friendRequestsCount = json['friend_requests_count'];
    followersCount = json['followers_count'];
    followingsCount = json['followings_count'];
    visitorsCount = json['visitors_count'];
    newVisitsCount = json['new_visits_count'];
    isFollowed = json['is_followed'];
    isFriend = json['is_friend'];
    amISentFriendRequest = json['am_i_sent_friend_request'];
    isHeSentFriendRequest = json['is_he_sent_friend_request'];
    ownRoom = json['own_room'] != null ? OwnRoom.fromJson(json['own_room']) : null;
    inRoom = json['in_room'];
    wallet = json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null;
    senderLevel = json['sender_level'] != null ? Level.fromJson(json['sender_level']) : null;
    consigneeLevel = json['consignee_level'] != null ? Level.fromJson(json['consignee_level']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['name'] = name;
    data['gender'] = gender;
    data['pio'] = pio;
    data['image'] = image;
    if (country != null) {
      data['country'] = country?.toJson();
    }
    data['balance'] = balance;
    data['friends_count'] = friendsCount;
    data['friend_requests_count'] = friendRequestsCount;
    data['followers_count'] = followersCount;
    data['followings_count'] = followingsCount;
    data['visitors_count'] = visitorsCount;
    data['new_visits_count'] = newVisitsCount;
    data['is_followed'] = isFollowed;
    data['is_friend'] = isFriend;
    data['am_i_sent_friend_request'] = amISentFriendRequest;
    data['is_he_sent_friend_request'] = isHeSentFriendRequest;
    if (ownRoom != null) {
      data['own_room'] = ownRoom?.toJson();
    }
    data['in_room'] = inRoom;
    if (wallet != null) {
      data['wallet'] = wallet?.toJson();
    }
    if (senderLevel != null) {
      data['sender_level'] = senderLevel?.toJson();
    }
    if (consigneeLevel != null) {
      data['consignee_level'] = consigneeLevel?.toJson();
    }
    data['time'] = time;
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? code;
  String? timeZone;
  String? flag;
  String? createdAt;
  String? updatedAt;

  Country({
    this.id,
    this.name,
    this.code,
    this.timeZone,
    this.flag,
    this.createdAt,
    this.updatedAt,
  });

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    timeZone = json['time_zone'];
    flag = json['flag'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['time_zone'] = timeZone;
    data['flag'] = flag;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class OwnRoom {
  int? id;
  String? name;
  String? intro;
  String? note;
  int? totalIncome;
  String? cover;
  String? background;
  String? frame;
  String? typeImage;
  String? password;
  String? typeName;
  bool? hasPassword;
  bool? isUserRoomBlocked;
  bool? isUserRoomChatBlocked;
  bool? isUserRoomMicBlocked;
  UserBlackListDetails? userBlackListDetails;
  bool? isOwner;

  OwnRoom({
    this.id,
    this.name,
    this.intro,
    this.note,
    this.totalIncome,
    this.cover,
    this.background,
    this.frame,
    this.typeImage,
    this.password,
    this.typeName,
    this.hasPassword,
    this.isUserRoomBlocked,
    this.isUserRoomChatBlocked,
    this.isUserRoomMicBlocked,
    this.userBlackListDetails,
    this.isOwner,
  });

  OwnRoom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    intro = json['intro'];
    note = json['note'];
    totalIncome = json['total_income'];
    cover = json['cover'];
    background = json['background'];
    frame = json['frame'];
    typeImage = json['type_image'];
    password = json['password'];
    typeName = json['type_name'];
    hasPassword = json['has_password'];
    isUserRoomBlocked = json['is_user_room_blocked'];
    isUserRoomChatBlocked = json['is_user_room_chat_blocked'];
    isUserRoomMicBlocked = json['is_user_room_mic_blocked'];
    userBlackListDetails = json['user_black_list_details'] != null ? UserBlackListDetails.fromJson(json['user_black_list_details']) : null;
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['intro'] = intro;
    data['note'] = note;
    data['total_income'] = totalIncome;
    data['cover'] = cover;
    data['background'] = background;
    data['frame'] = frame;
    data['type_image'] = typeImage;
    data['password'] = password;
    data['type_name'] = typeName;
    data['has_password'] = hasPassword;
    data['is_user_room_blocked'] = isUserRoomBlocked;
    data['is_user_room_chat_blocked'] = isUserRoomChatBlocked;
    data['is_user_room_mic_blocked'] = isUserRoomMicBlocked;
    if (userBlackListDetails != null) {
      data['user_black_list_details'] = userBlackListDetails?.toJson();
    }
    data['is_owner'] = isOwner;
    return data;
  }
}

class UserBlackListDetails {
  int? id;
  String? reason;
  String? type;
  String? addedAt;
  String? endAt;

  UserBlackListDetails({this.id, this.reason, this.type, this.addedAt, this.endAt});

  UserBlackListDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reason = json['reason'];
    type = json['type'];
    addedAt = json['added_at'];
    endAt = json['end_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['reason'] = reason;
    data['type'] = type;
    data['added_at'] = addedAt;
    data['end_at'] = endAt;
    return data;
  }
}

class Wallet {
  int? id;
  double? balance;

  Wallet({this.id, this.balance});

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balance = json['balance']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['balance'] = balance;
    return data;
  }
}

class Level {
  int? id;
  String? name;
  int? number;
  String? image;

  Level({this.id, this.name, this.number, this.image});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['number'] = number;
    data['image'] = image;
    return data;
  }
}
