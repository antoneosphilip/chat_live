import 'package:live_app/data/model/response/user_model.dart';
import 'conversation_model.dart';
import 'country_model.dart';
import 'family_model.dart';

class RoomModel {
  int? id;
  String? name;
  String? intro;
  String? note;
  int? totalIncome;
  String? cover;
  String? background;
  String? frame;
  String? password;
  String? type_name;
  String? type_image;
  bool? hasPassword;
  bool? isUserRoomBlocked;
  bool? isUserRoomChatBlocked;
  bool? isUserRoomMicBlocked;
  bool? isOwner;
  int? adminsCount;
  int? visitorsCount;
  Owner? owner;
  List<Chairs>? chairs;

  RoomModel({
    this.id,
    this.name,
    this.intro,
    this.note,
    this.totalIncome,
    this.cover,
    this.background,
    this.frame,
    this.password,
    this.type_name,
    this.type_image,
    this.hasPassword,
    this.isUserRoomBlocked,
    this.isUserRoomChatBlocked,
    this.isUserRoomMicBlocked,
    this.isOwner,
    this.adminsCount,
    this.visitorsCount,
    this.owner,
    this.chairs,
  });

  RoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    intro = json['intro'];
    note = json['note'];
    totalIncome = json['total_income'];
    cover = json['cover'];
    background = json['background'];
    frame = json['frame'];
    password = json['password'];
    type_name = json['type_name'];
    type_image = json['type_image'];
    hasPassword = json['has_password'];
    isUserRoomBlocked = json['is_user_room_blocked'];
    isUserRoomChatBlocked = json['is_user_room_chat_blocked'];
    isUserRoomMicBlocked = json['is_user_room_mic_blocked'];
    isOwner = json['is_owner'];
    adminsCount = json['admins_count'];
    visitorsCount = json['visitors_count'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    if (json['chairs'] != null) {
      chairs = <Chairs>[];
      json['chairs'].forEach((v) {
        chairs!.add(Chairs.fromJson(v));
      });
    }
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
    data['password'] = password;
    data['type_name'] = type_name;
    data['type_image'] = type_image;
    data['has_password'] = hasPassword;
    data['is_user_room_blocked'] = isUserRoomBlocked;
    data['is_user_room_chat_blocked'] = isUserRoomChatBlocked;
    data['is_user_room_mic_blocked'] = isUserRoomMicBlocked;
    data['is_owner'] = isOwner;
    data['admins_count'] = adminsCount;
    data['visitors_count'] = visitorsCount;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    if (chairs != null) {
      data['chairs'] = chairs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Owner {
  int? id;
  int? uuid;
  String? name;
  String? image;
  CountryModel? country;

  Owner({this.id, this.uuid, this.name, this.image, this.country});

  Owner.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    uuid = json?['uuid'];
    name = json?['name'];
    image = json?['image'];
    country = CountryModel.fromJson(json?['country']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['name'] = name;
    data['image'] = image;
    data['country'] = country?.toJson();
    return data;
  }
}

class Chairs {
  int? id;
  int? chairNo;
  String? icon;
  int? isLocked;
  int? isMuted;
  int? isFeatured;
  int? isForAdmin;
  int? teamNumber;
  User? user;

  Chairs({
    this.id,
    this.chairNo,
    this.icon,
    this.isLocked,
    this.isMuted,
    this.isFeatured,
    this.isForAdmin,
    this.teamNumber,
    this.user,
  });

  Chairs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chairNo = json['chair_no'];
    icon = json['icon'];
    isLocked = json['is_locked'];
    isMuted = json['is_muted'];
    isFeatured = json['is_featured'];
    isForAdmin = json['is_for_admin'];
    teamNumber = json['team_number'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['chair_no'] = chairNo;
    data['icon'] = icon;
    data['is_locked'] = isLocked;
    data['is_muted'] = isMuted;
    data['is_featured'] = isFeatured;
    data['is_for_admin'] = isForAdmin;
    data['team_number'] = teamNumber;
    if (user != null) {
      // data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  final int id;
  final int uuid;
  final String name;
  final String gender;
  final String pio;
  final String image;
  final Country? country;
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
  final Room? ownRoom;
  final Room inRoom;
  final Wallet wallet;
  final SenderLevel senderLevel;
  final ConsigneeLevel consigneeLevel;
  final String? time;

  User({
    required this.id,
    required this.uuid,
    required this.name,
    required this.gender,
    required this.pio,
    required this.image,
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
    required this.inRoom,
    required this.wallet,
    required this.senderLevel,
    required this.consigneeLevel,
    this.time,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      uuid: json['uuid'],
      name: json['name'],
      gender: json['gender'],
      pio: json['pio'],
      image: json['image'],
      country: json['country'] != null ? Country.fromJson(json['country']) : null,
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
      ownRoom: json['own_room'] != null ? Room.fromJson(json['own_room']) : null,
      inRoom: Room.fromJson(json['in_room']),
      wallet: Wallet.fromJson(json['wallet']),
      senderLevel: SenderLevel.fromJson(json['sender_level']),
      consigneeLevel: ConsigneeLevel.fromJson(json['consignee_level']),
      time: json['time'],
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
  final double totalIncome;
  final String cover;
  final String? background;
  final String frame;
  final String typeImage;
  final String? password;
  final String? typeName;
  final bool hasPassword;
  final bool isUserRoomBlocked;
  final bool isUserRoomChatBlocked;
  final bool isUserRoomMicBlocked;
  final UserBlackListDetails userBlackListDetails;
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
    this.typeName,
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
      totalIncome: json['total_income'].toDouble(),
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
      userBlackListDetails: UserBlackListDetails.fromJson(json['user_black_list_details']),
      isOwner: json['is_owner'],
    );
  }
}

class UserBlackListDetails {
  final String? room;
  final String? mic;
  final String? chat;

  UserBlackListDetails({
    this.room,
    this.mic,
    this.chat,
  });

  factory UserBlackListDetails.fromJson(Map<String, dynamic> json) {
    return UserBlackListDetails(
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

class SenderLevel {
  final int currentNo;
  final String currentImage;
  final int nextNo;
  final String nextImage;
  final double value;

  SenderLevel({
    required this.currentNo,
    required this.currentImage,
    required this.nextNo,
    required this.nextImage,
    required this.value,
  });

  factory SenderLevel.fromJson(Map<String, dynamic> json) {
    return SenderLevel(
      currentNo: json['current_no'],
      currentImage: json['current_image'],
      nextNo: json['next_no'],
      nextImage: json['next_image'],
      value: json['value'].toDouble(),
    );
  }
}

class ConsigneeLevel {
  final int currentNo;
  final String currentImage;
  final int nextNo;
  final String nextImage;
  final double value;

  ConsigneeLevel({
    required this.currentNo,
    required this.currentImage,
    required this.nextNo,
    required this.nextImage,
    required this.value,
  });

  factory ConsigneeLevel.fromJson(Map<String, dynamic> json) {
    return ConsigneeLevel(
      currentNo: json['current_no'],
      currentImage: json['current_image'],
      nextNo: json['next_no'],
      nextImage: json['next_image'],
      value: json['value'].toDouble(),
    );
  }
}
