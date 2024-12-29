

import 'package:live_app/data/model/response/room_model.dart';
import 'package:live_app/data/model/response/user_model.dart';

class ShowRoomModel {
  ShowRoomData? showRoomData;

  ShowRoomModel({this.showRoomData});

  ShowRoomModel.fromJson(Map<String, dynamic> json) {
    showRoomData = json['data'] != null ? ShowRoomData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    if (showRoomData != null) {
      result['data'] = showRoomData!.toJson();
    }
    return result;
  }
}

class ShowRoomData {
  int? id;
  String? name;
  String? intro;
  dynamic note;
  int? totalIncome;
  String? cover;
  dynamic background;
  String? frame;
  String? typeImage;
  dynamic password;
  String? typeName;
  bool? hasPassword;
  bool? isUserRoomBlocked;
  bool? isUserRoomChatBlocked;
  bool? isUserRoomMicBlocked;
  UserBlackListDetails? userBlackListDetails;
  bool? isOwner;
  int? adminsCount;
  int? visitorsCount;
  int? chairsCount;
  List<Admin>? admins;
  List<Visitor>? visitors;
  List<Chair>? chairs;

  ShowRoomData({
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
    this.adminsCount,
    this.visitorsCount,
    this.chairsCount,
    this.admins,
    this.visitors,
    this.chairs,
  });

  ShowRoomData.fromJson(Map<String, dynamic> json) {
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
    userBlackListDetails = json['user_black_list_details'] != null
        ? UserBlackListDetails.fromJson(json['user_black_list_details'])
        : null;
    isOwner = json['is_owner'];
    adminsCount = json['admins_count'];
    visitorsCount = json['visitors_count'];
    chairsCount = json['chairs_count'];
    if (json['admins'] != null) {
      admins = <Admin>[];
      json['admins'].forEach((v) {
        admins!.add(Admin.fromJson(v));
      });
    }
    if (json['visitors'] != null) {
      visitors = <Visitor>[];
      json['visitors'].forEach((v) {
        visitors!.add(Visitor.fromJson(v));
      });
    }
    if (json['chairs'] != null) {
      chairs = <Chair>[];
      json['chairs'].forEach((v) {
        chairs!.add(Chair.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    result['id'] = id;
    result['name'] = name;
    result['intro'] = intro;
    result['note'] = note;
    result['total_income'] = totalIncome;
    result['cover'] = cover;
    result['background'] = background;
    result['frame'] = frame;
    result['type_image'] = typeImage;
    result['password'] = password;
    result['type_name'] = typeName;
    result['has_password'] = hasPassword;
    result['is_user_room_blocked'] = isUserRoomBlocked;
    result['is_user_room_chat_blocked'] = isUserRoomChatBlocked;
    result['is_user_room_mic_blocked'] = isUserRoomMicBlocked;
    if (userBlackListDetails != null) {
      // result['user_black_list_details'] = userBlackListDetails!.toJson();
    }
    result['is_owner'] = isOwner;
    result['admins_count'] = adminsCount;
    result['visitors_count'] = visitorsCount;
    result['chairs_count'] = chairsCount;
    if (admins != null) {
      // result['admins'] = admins!.map((v) => v.toJson()).toList();
    }
    if (visitors != null) {
      // result['visitors'] = visitors!.map((v) => v.toJson()).toList();
    }
    if (chairs != null) {
      result['chairs'] = chairs!.map((v) => v.toJson()).toList();
    }
    return result;
  }
}
class Admin {
  int id;
  int uuid;
  String name;
  String gender;
  String pio;
  String? image;
  String? country;
  int balance;
  int friendsCount;
  int friendRequestsCount;
  int followersCount;
  int followingsCount;
  int visitorsCount;
  int newVisitsCount;
  bool isFollowed;
  bool isFriend;
  bool amISentFriendRequest;
  bool isHeSentFriendRequest;
  Room? ownRoom;
  Room? inRoom;
  Wallet? wallet;
  Level senderLevel;
  Level consigneeLevel;
  DateTime? time;

  Admin({
    required this.id,
    required this.uuid,
    required this.name,
    required this.gender,
    required this.pio,
    this.image,
    this.country,
    required this.balance,
    required this.friendsCount,
    required this.friendRequestsCount,
    required this.followersCount,
    required this.followingsCount,
    required this.visitorsCount,
    required this.newVisitsCount,
    required this.isFollowed,
    required this.isFriend,
    required this.amISentFriendRequest,
    required this.isHeSentFriendRequest,
    this.ownRoom,
    this.inRoom,
    this.wallet,
    required this.senderLevel,
    required this.consigneeLevel,
    this.time,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['id'],
      uuid: json['uuid'],
      name: json['name'],
      gender: json['gender'],
      pio: json['pio'],
      image: json['image'],
      country: json['country'],
      balance: json['balance'],
      friendsCount: json['friends_count'],
      friendRequestsCount: json['friend_requests_count'],
      followersCount: json['followers_count'],
      followingsCount: json['followings_count'],
      visitorsCount: json['visitors_count'],
      newVisitsCount: json['new_visits_count'],
      isFollowed: json['is_followed'],
      isFriend: json['is_friend'],
      amISentFriendRequest: json['am_i_sent_friend_request'],
      isHeSentFriendRequest: json['is_he_sent_friend_request'],
      ownRoom: json['own_room'] != null ? Room.fromJson(json['own_room']) : null,
      inRoom: json['in_room'] != null ? Room.fromJson(json['in_room']) : null,
      wallet: json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null,
      senderLevel: Level.fromJson(json['sender_level']),
      consigneeLevel: Level.fromJson(json['consignee_level']),
      time: json['time'] != null ? DateTime.parse(json['time']) : null,
    );
  }

}
class Visitor {
  final int id;
  final int uuid;
  final String name;
  final String gender;
  final String pio;
  final String image;
  final Country country;
  final double balance;
  final int friendsCount;
  final int friendRequestsCount;
  final int followersCount;
  final int followingsCount;
  final int visitorsCount;
  final int newVisitsCount;
  final bool isFollowed;
  final bool isFriend;
  final bool amISentFriendRequest;
  final bool isHeSentFriendRequest;
  final Room ownRoom;
  final Room inRoom;
  final Wallet wallet;
  final Level senderLevel;
  final Level consigneeLevel;
  final DateTime? time;

  Visitor({
    required this.id,
    required this.uuid,
    required this.name,
    required this.gender,
    required this.pio,
    required this.image,
    required this.country,
    required this.balance,
    required this.friendsCount,
    required this.friendRequestsCount,
    required this.followersCount,
    required this.followingsCount,
    required this.visitorsCount,
    required this.newVisitsCount,
    required this.isFollowed,
    required this.isFriend,
    required this.amISentFriendRequest,
    required this.isHeSentFriendRequest,
    required this.ownRoom,
    required this.inRoom,
    required this.wallet,
    required this.senderLevel,
    required this.consigneeLevel,
    this.time,
  });

  factory Visitor.fromJson(Map<String, dynamic> json) {
    return Visitor(
      id: json['id'],
      uuid: json['uuid'],
      name: json['name'],
      gender: json['gender'],
      pio: json['pio'],
      image: json['image'],
      country: Country.fromJson(json['country']),
      balance: json['balance'].toDouble(),
      friendsCount: json['friends_count'],
      friendRequestsCount: json['friend_requests_count'],
      followersCount: json['followers_count'],
      followingsCount: json['followings_count'],
      visitorsCount: json['visitors_count'],
      newVisitsCount: json['new_visits_count'],
      isFollowed: json['is_followed'],
      isFriend: json['is_friend'],
      amISentFriendRequest: json['am_i_sent_friend_request'],
      isHeSentFriendRequest: json['is_he_sent_friend_request'],
      ownRoom: Room.fromJson(json['own_room']),
      inRoom: Room.fromJson(json['in_room']),
      wallet: Wallet.fromJson(json['wallet']),
      senderLevel: Level.fromJson(json['sender_level']),
      consigneeLevel: Level.fromJson(json['consignee_level']),
      time: json['time'] != null ? DateTime.parse(json['time']) : null,
    );
  }
}

class Country {
  final int id;
  final String name;
  final String code;
  final String timeZone;
  final String flag;
  final DateTime createdAt;
  final DateTime updatedAt;

  Country({
    required this.id,
    required this.name,
    required this.code,
    required this.timeZone,
    required this.flag,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      timeZone: json['time_zone'],
      flag: json['flag'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class Room {
  final int id;
  final String name;
  final String intro;
  final String? note;
  final int totalIncome;
  final String cover;
  final String? background;
  final String frame;
  final String typeImage;
  final String? password;
  final String typeName;
  final bool hasPassword;
  final bool isUserRoomBlocked;
  final bool isUserRoomChatBlocked;
  final bool isUserRoomMicBlocked;
  final BlackListDetails userBlackListDetails;
  final bool isOwner;

  Room({
    required this.id,
    required this.name,
    required this.intro,
    this.note,
    required this.totalIncome,
    required this.cover,
    this.background,
    required this.frame,
    required this.typeImage,
    this.password,
    required this.typeName,
    required this.hasPassword,
    required this.isUserRoomBlocked,
    required this.isUserRoomChatBlocked,
    required this.isUserRoomMicBlocked,
    required this.userBlackListDetails,
    required this.isOwner,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      name: json['name'],
      intro: json['intro'],
      note: json['note'],
      totalIncome: json['total_income'],
      cover: json['cover'],
      background: json['background'],
      frame: json['frame'],
      typeImage: json['type_image'],
      password: json['password'],
      typeName: json['type_name'],
      hasPassword: json['has_password'],
      isUserRoomBlocked: json['is_user_room_blocked'],
      isUserRoomChatBlocked: json['is_user_room_chat_blocked'],
      isUserRoomMicBlocked: json['is_user_room_mic_blocked'],
      userBlackListDetails: BlackListDetails.fromJson(json['user_black_list_details']),
      isOwner: json['is_owner'],
    );
  }
}

class BlackListDetails {
  final String? room;
  final String? mic;
  final String? chat;

  BlackListDetails({this.room, this.mic, this.chat});

  factory BlackListDetails.fromJson(Map<String, dynamic> json) {
    return BlackListDetails(
      room: json['room'],
      mic: json['mic'],
      chat: json['chat'],
    );
  }
}

class Wallet {
  final int id;
  final int userId;
  final String diamond;
  final String gold;
  final String silver;
  final String gameCoins;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String usd;

  Wallet({
    required this.id,
    required this.userId,
    required this.diamond,
    required this.gold,
    required this.silver,
    required this.gameCoins,
    required this.createdAt,
    required this.updatedAt,
    required this.usd,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      id: json['id'],
      userId: json['user_id'],
      diamond: json['diamond'],
      gold: json['gold'],
      silver: json['silver'],
      gameCoins: json['game_coins'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      usd: json['usd'],
    );
  }
}

class Level {
  final int currentNo;
  final String currentImage;
  final int nextNo;
  final String nextImage;
  final double value;

  Level({
    required this.currentNo,
    required this.currentImage,
    required this.nextNo,
    required this.nextImage,
    required this.value,
  });

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      currentNo: json['current_no'],
      currentImage: json['current_image'],
      nextNo: json['next_no'],
      nextImage: json['next_image'],
      value: json['value'].toDouble(),
    );
  }
}
class Chair {
  final int id;
  final int chairNo;
  final String icon;
  final bool isLocked;
  final bool isMuted;
  final bool isFeatured;
  final bool isForAdmin;
  final int teamNumber;
  final dynamic user;

  Chair({
    required this.id,
    required this.chairNo,
    required this.icon,
    required this.isLocked,
    required this.isMuted,
    required this.isFeatured,
    required this.isForAdmin,
    required this.teamNumber,
    this.user,
  });

  factory Chair.fromJson(Map<String, dynamic> json) {
    return Chair(
      id: json['id'],
      chairNo: json['chair_no'],
      icon: json['icon'],
      isLocked: json['is_locked'] == 1,
      isMuted: json['is_muted'] == 1,
      isFeatured: json['is_featured'] == 1,
      isForAdmin: json['is_for_admin'] == 1,
      teamNumber: json['team_number'],
      user: json['user'], // Modify type based on actual user structure if needed
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chair_no': chairNo,
      'icon': icon,
      'is_locked': isLocked ? 1 : 0,
      'is_muted': isMuted ? 1 : 0,
      'is_featured': isFeatured ? 1 : 0,
      'is_for_admin': isForAdmin ? 1 : 0,
      'team_number': teamNumber,
      'user': user,
    };
  }
}



// Define Admin, Visitor, UserBlackListDetails, and Chair classes similarly
// Each class should follow the same pattern, with nullable fields and JSON serialization/deserialization logic
