import 'package:live_app/data/model/response/country_model.dart';
import 'package:live_app/data/model/response/room_model.dart';

import 'gift_model.dart';

class UserModel {
  int? id;
  int? uuid;
  String? name;
  String? gender;
  String? pio;
  String? image;
  CountryModel? country;
  num? balance;
  int? friendsCount;
  int? friendRequestsCount;
  dynamic followersCount;
  dynamic followingsCount;
  dynamic visitorsCount;
  int? newVisitsCount;
  bool? isFollowed;
  bool? isFriend;
  bool? amISentFriendRequest;
  bool? isHeSentFriendRequest;
  RoomModel? ownRoom;
  RoomModel? inRoom;
  WalletModel? wallet;
  Level? senderLevel;
  Level? consigneeLevel;
  String? time;

  // New properties
  FamilyModel? family;
  List<GiftModel>? receivedGifts;
  List<GiftModel>? sentGifts;
  String? wealth;
  String? charm;
  List<UserModel>? topSupporters;
  bool? hasFamily;

  UserModel({
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
    this.family,
    this.receivedGifts,
    this.sentGifts,
    this.wealth,
    this.charm,
    this.topSupporters,
    this.hasFamily,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    gender = json['gender'];
    pio = json['pio'];
    image = json['image'];
    country = json['country'] != null ? CountryModel.fromJson(json['country']) : null;
    balance = json['balance'];
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
    ownRoom = json['own_room'] != null ? RoomModel.fromJson(json['own_room']) : null;
    inRoom = json['in_room'] != null ? RoomModel.fromJson(json['in_room']) : null;
    wallet = json['wallet'] != null ? WalletModel.fromJson(json['wallet']) : WalletModel(diamond: '0',gameCoins: '0',gold: '0',silver: '0',);
    senderLevel = json['sender_level'] != null ? Level.fromJson(json['sender_level']) : null;
    consigneeLevel = json['consignee_level'] != null ? Level.fromJson(json['consignee_level']) : null;
    time = json['time'];

    // New property assignments
    family = json['family'] != null ? FamilyModel.fromJson(json['family']) : null;
    if (json['receivedGifts'] != null) {
      receivedGifts = (json['receivedGifts'] as List)
          .map((gift) => GiftModel.fromJson(gift))
          .toList();
    }
    if (json['sentGifts'] != null) {
      sentGifts = (json['sentGifts'] as List)
          .map((gift) => GiftModel.fromJson(gift))
          .toList();
    }
    wealth = json['wealth'];
    charm = json['charm'];
    if (json['top_supporters'] != null) {
      topSupporters = (json['top_supporters'] as List)
          .map((user) => UserModel.fromJson(user))
          .toList();
    }
    hasFamily = json['has_family'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['uuid'] = uuid;
    data['name'] = name;
    data['gender'] = gender;
    data['pio'] = pio;
    data['image'] = image;
    data['country'] = country?.toJson();
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
    data['own_room'] = ownRoom?.toJson();
    data['in_room'] = inRoom?.toJson();
    data['wallet'] = wallet?.toJson();
    data['time'] = time;

    // New property serialization
    data['family'] = family?.toJson();
    data['receivedGifts'] = receivedGifts?.map((gift) => gift.toJson()).toList();
    data['sentGifts'] = sentGifts?.map((gift) => gift.toJson()).toList();
    data['wealth'] = wealth;
    data['charm'] = charm;
    data['top_supporters'] = topSupporters?.map((user) => user.toJson()).toList();
    data['has_family'] = hasFamily;
    return data;
  }
}

class FamilyModel {
  int? id;
  String? name;
  String? introduce;
  String? notice;
  String? image;
  int? points;
  int? membersCount;

  FamilyModel({
    this.id,
    this.name,
    this.introduce,
    this.notice,
    this.image,
    this.points,
    this.membersCount,
  });

  FamilyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    introduce = json['introduce'];
    notice = json['notice'];
    image = json['image'];
    points = json['points'];
    membersCount = json['members_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['introduce'] = introduce;
    data['notice'] = notice;
    data['image'] = image;
    data['points'] = points;
    data['members_count'] = membersCount;
    return data;
  }
}
class WalletModel {
  int? id;
  int? userId;
  String? diamond;
  String? gold;
  String? silver;
  String? gameCoins;
  String? usd;
  String? createdAt;
  String? updatedAt;

  WalletModel({
    this.id,
    this.userId,
    this.diamond,
    this.gold,
    this.silver,
    this.gameCoins,
    this.usd,
    this.createdAt,
    this.updatedAt,
  });

  WalletModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    diamond = json['diamond'];
    gold = json['gold'];
    silver = json['silver'];
    gameCoins = json['game_coins'];
    usd = json['usd'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['user_id'] = userId;
    data['diamond'] = diamond;
    data['gold'] = gold;
    data['silver'] = silver;
    data['game_coins'] = gameCoins;
    data['usd'] = usd;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
class Level {
  int? currentNo;
  String? currentImage;
  int? nextNo;
  String? nextImage;
  double? value;

  Level({
    this.currentNo,
    this.currentImage,
    this.nextNo,
    this.nextImage,
    this.value,
  });

  Level.fromJson(Map<String, dynamic> json) {
    currentNo = json['current_no'];
    currentImage = json['current_image'];
    nextNo = json['next_no'];
    nextImage = json['next_image'];
    value = json['value'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['current_no'] = currentNo;
    data['current_image'] = currentImage;
    data['next_no'] = nextNo;
    data['next_image'] = nextImage;
    data['value'] = value;
    return data;
  }
}


