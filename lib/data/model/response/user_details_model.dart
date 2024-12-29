import 'package:live_app/data/model/response/room_model.dart';
import 'package:live_app/data/model/response/user_model.dart';

class UserDetailsModel {
  int? id;
  int? uuid;
  String? name;
  String? gender;
  String? pio;
  String? image;
  Country? country;
  int? friendsCount;
  int? friendRequestsCount;
  String? followersCount;
  String? followingsCount;
  String? visitorsCount;
  int? newVisitsCount;
  bool? isFollowed;
  bool? isFriend;
  bool? amISentFriendRequest;
  bool? isHeSentFriendRequest;
  OwnRoom? ownRoom;
  RoomModel? inRoom;
  Wallet? wallet;
  SenderLevel? senderLevel;
  SenderLevel? consigneeLevel;
  FamilyModel? family;
  List<ReceivedGifts>? receivedGifts;
  List<SentGifts>? sentGifts;
  String? wealth;
  String? charm;
  List<UserModel>? topSupporters;

  UserDetailsModel(
      {this.id,
      this.uuid,
      this.name,
      this.gender,
      this.pio,
      this.image,
      this.country,
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
      this.family,
      this.receivedGifts,
      this.sentGifts,
      this.wealth,
      this.charm,
      this.topSupporters});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    gender = json['gender'];
    pio = json['pio'];
    image = json['image'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
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
    ownRoom = json['own_room'] != null
        ? new OwnRoom.fromJson(json['own_room'])
        : null;
    inRoom =
        json['in_room'] != null ? RoomModel.fromJson(json['in_room']) : null;
    wallet =
        json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
    senderLevel = json['sender_level'] != null
        ? new SenderLevel.fromJson(json['sender_level'])
        : null;
    consigneeLevel = json['consignee_level'] != null
        ? new SenderLevel.fromJson(json['consignee_level'])
        : null;
    family = json['family']!=null?new FamilyModel.fromJson(json['family']):null;
    if (json['receivedGifts'] != null) {
      receivedGifts = <ReceivedGifts>[];
      json['receivedGifts'].forEach((v) {
        receivedGifts!.add(new ReceivedGifts.fromJson(v));
      });
    }
    if (json['sentGifts'] != null) {
      sentGifts = <SentGifts>[];
      json['sentGifts'].forEach((v) {
        sentGifts!.add(new SentGifts.fromJson(v));
      });
    }
    wealth = json['wealth'];
    charm = json['charm'];
    if (json['top_supporters'] != null) {
      topSupporters = <UserModel>[];
      json['top_supporters'].forEach((v) {
        topSupporters!.add(UserModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['pio'] = this.pio;
    data['image'] = this.image;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['friends_count'] = this.friendsCount;
    data['friend_requests_count'] = this.friendRequestsCount;
    data['followers_count'] = this.followersCount;
    data['followings_count'] = this.followingsCount;
    data['visitors_count'] = this.visitorsCount;
    data['new_visits_count'] = this.newVisitsCount;
    data['is_followed'] = this.isFollowed;
    data['is_friend'] = this.isFriend;
    data['am_i_sent_friend_request'] = this.amISentFriendRequest;
    data['is_he_sent_friend_request'] = this.isHeSentFriendRequest;
    if (this.ownRoom != null) {
      data['own_room'] = this.ownRoom!.toJson();
    }
    data['in_room'] = this.inRoom;
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    if (this.senderLevel != null) {
      data['sender_level'] = this.senderLevel!.toJson();
    }
    if (this.consigneeLevel != null) {
      data['consignee_level'] = this.consigneeLevel!.toJson();
    }
    data['family'] = this.family;
    if (this.receivedGifts != null) {
      data['receivedGifts'] =
          this.receivedGifts!.map((v) => v.toJson()).toList();
    }
    if (this.sentGifts != null) {
      data['sentGifts'] = this.sentGifts!.map((v) => v.toJson()).toList();
    }
    data['wealth'] = this.wealth;
    data['charm'] = this.charm;
    if (this.topSupporters != null) {
      data['top_supporters'] =
          this.topSupporters!.map((v) => v.toJson()).toList();
    }
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

  Country(
      {this.id,
      this.name,
      this.code,
      this.timeZone,
      this.flag,
      this.createdAt,
      this.updatedAt});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['time_zone'] = this.timeZone;
    data['flag'] = this.flag;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  String? typeImage;
  String? password;
  String? typeName;
  bool? hasPassword;
  bool? isUserRoomBlocked;
  bool? isUserRoomChatBlocked;
  bool? isUserRoomMicBlocked;
  UserBlackListDetails? userBlackListDetails;
  bool? isOwner;

  OwnRoom(
      {this.id,
      this.name,
      this.intro,
      this.note,
      this.totalIncome,
      this.cover,
      this.background,
      this.typeImage,
      this.password,
      this.typeName,
      this.hasPassword,
      this.isUserRoomBlocked,
      this.isUserRoomChatBlocked,
      this.isUserRoomMicBlocked,
      this.userBlackListDetails,
      this.isOwner});

  OwnRoom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    intro = json['intro'];
    note = json['note'];
    totalIncome = json['total_income'];
    cover = json['cover'];
    background = json['background'];
    typeImage = json['type_image'];
    password = json['password'];
    typeName = json['type_name'];
    hasPassword = json['has_password'];
    isUserRoomBlocked = json['is_user_room_blocked'];
    isUserRoomChatBlocked = json['is_user_room_chat_blocked'];
    isUserRoomMicBlocked = json['is_user_room_mic_blocked'];
    userBlackListDetails = json['user_black_list_details'] != null
        ? new UserBlackListDetails.fromJson(json['user_black_list_details'])
        : null;
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['intro'] = this.intro;
    data['note'] = this.note;
    data['total_income'] = this.totalIncome;
    data['cover'] = this.cover;
    data['background'] = this.background;
    data['type_image'] = this.typeImage;
    data['password'] = this.password;
    data['type_name'] = this.typeName;
    data['has_password'] = this.hasPassword;
    data['is_user_room_blocked'] = this.isUserRoomBlocked;
    data['is_user_room_chat_blocked'] = this.isUserRoomChatBlocked;
    data['is_user_room_mic_blocked'] = this.isUserRoomMicBlocked;
    if (this.userBlackListDetails != null) {
      data['user_black_list_details'] = this.userBlackListDetails!.toJson();
    }
    data['is_owner'] = this.isOwner;
    return data;
  }
}

class UserBlackListDetails {
  String? room;
  String? mic;
  String? chat;

  UserBlackListDetails({this.room, this.mic, this.chat});

  UserBlackListDetails.fromJson(Map<String, dynamic> json) {
    room = json['room'];
    mic = json['room'];
    chat = json['room'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room'] = this.room;
    data['mic'] = this.mic;
    data['chat'] = this.chat;
    return data;
  }
}

class Wallet {
  int? id;
  int? userId;
  String? diamond;
  String? gold;
  String? silver;
  String? gameCoins;
  String? createdAt;
  String? updatedAt;

  Wallet(
      {this.id,
      this.userId,
      this.diamond,
      this.gold,
      this.silver,
      this.gameCoins,
      this.createdAt,
      this.updatedAt});

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    diamond = json['diamond'];
    gold = json['gold'];
    silver = json['silver'];
    gameCoins = json['game_coins'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['diamond'] = this.diamond;
    data['gold'] = this.gold;
    data['silver'] = this.silver;
    data['game_coins'] = this.gameCoins;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SenderLevel {
  int? currentNo;
  String? currentImage;
  int? nextNo;
  String? nextImage;
  double? value;

  SenderLevel(
      {this.currentNo,
      this.currentImage,
      this.nextNo,
      this.nextImage,
      this.value});

  SenderLevel.fromJson(Map<String, dynamic> json) {
    currentNo = json['current_no'];
    currentImage = json['current_image'];
    nextNo = json['next_no'];
    nextImage = json['next_image'];
    value = double.parse("${json['value']}");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_no'] = this.currentNo;
    data['current_image'] = this.currentImage;
    data['next_no'] = this.nextNo;
    data['next_image'] = this.nextImage;
    data['value'] = this.value;
    return data;
  }
}

class ReceivedGifts {
  int? giftId;
  String? thumbnail;
  String? price;
  String? totalQty;

  ReceivedGifts({this.giftId, this.thumbnail, this.price, this.totalQty});

  ReceivedGifts.fromJson(Map<String, dynamic> json) {
    giftId = json['gift_id'];
    thumbnail = json['thumbnail'];
    price = json['price'];
    totalQty = json['total_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gift_id'] = this.giftId;
    data['thumbnail'] = this.thumbnail;
    data['price'] = this.price;
    data['total_qty'] = this.totalQty;
    return data;
  }
}

class SentGifts {
  int? giftId;
  String? thumbnail;
  String? price;
  String? totalQty;

  SentGifts({this.giftId, this.thumbnail, this.price, this.totalQty});

  SentGifts.fromJson(Map<String, dynamic> json) {
    giftId = json['gift_id'];
    thumbnail = json['thumbnail'];
    price = json['price'];
    totalQty = json['total_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gift_id'] = this.giftId;
    data['thumbnail'] = this.thumbnail;
    data['price'] = this.price;
    data['total_qty'] = this.totalQty;
    return data;
  }
}
