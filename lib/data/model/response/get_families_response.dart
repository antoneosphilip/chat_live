// class GetFamilies {
//   bool success;
//   int status;
//   String message;
//   Data data;
//
//   GetFamilies({this.success, this.status, this.message, this.data});
//
//   GetFamilies.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   int id;
//   String name;
//   String introduce;
//   String notice;
//   String image;
//   int points;
//   Owner owner;
//   int membersCount;
//   List<Null> members;
//   String currentUserType;
//
//   Data(
//       {this.id,
//         this.name,
//         this.introduce,
//         this.notice,
//         this.image,
//         this.points,
//         this.owner,
//         this.membersCount,
//         this.members,
//         this.currentUserType});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     introduce = json['introduce'];
//     notice = json['notice'];
//     image = json['image'];
//     points = json['points'];
//     owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
//     membersCount = json['members_count'];
//     if (json['members'] != null) {
//       members = new List<Null>();
//       json['members'].forEach((v) {
//         members.add(new Null.fromJson(v));
//       });
//     }
//     currentUserType = json['current_user_type'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['introduce'] = this.introduce;
//     data['notice'] = this.notice;
//     data['image'] = this.image;
//     data['points'] = this.points;
//     if (this.owner != null) {
//       data['owner'] = this.owner.toJson();
//     }
//     data['members_count'] = this.membersCount;
//     if (this.members != null) {
//       data['members'] = this.members.map((v) => v.toJson()).toList();
//     }
//     data['current_user_type'] = this.currentUserType;
//     return data;
//   }
// }
//
// class Owner {
//   int id;
//   int uuid;
//   String name;
//   String gender;
//   String pio;
//   String image;
//   Country country;
//   double balance;
//   int friendsCount;
//   int friendRequestsCount;
//   int followersCount;
//   int followingsCount;
//   int visitorsCount;
//   int newVisitsCount;
//   bool isFollowed;
//   bool isFriend;
//   bool amISentFriendRequest;
//   bool isHeSentFriendRequest;
//   OwnRoom ownRoom;
//   Null inRoom;
//   Wallet wallet;
//   SenderLevel senderLevel;
//   SenderLevel consigneeLevel;
//   Null time;
//
//   Owner(
//       {this.id,
//         this.uuid,
//         this.name,
//         this.gender,
//         this.pio,
//         this.image,
//         this.country,
//         this.balance,
//         this.friendsCount,
//         this.friendRequestsCount,
//         this.followersCount,
//         this.followingsCount,
//         this.visitorsCount,
//         this.newVisitsCount,
//         this.isFollowed,
//         this.isFriend,
//         this.amISentFriendRequest,
//         this.isHeSentFriendRequest,
//         this.ownRoom,
//         this.inRoom,
//         this.wallet,
//         this.senderLevel,
//         this.consigneeLevel,
//         this.time});
//
//   Owner.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     uuid = json['uuid'];
//     name = json['name'];
//     gender = json['gender'];
//     pio = json['pio'];
//     image = json['image'];
//     country =
//     json['country'] != null ? new Country.fromJson(json['country']) : null;
//     balance = json['balance'];
//     friendsCount = json['friends_count'];
//     friendRequestsCount = json['friend_requests_count'];
//     followersCount = json['followers_count'];
//     followingsCount = json['followings_count'];
//     visitorsCount = json['visitors_count'];
//     newVisitsCount = json['new_visits_count'];
//     isFollowed = json['is_followed'];
//     isFriend = json['is_friend'];
//     amISentFriendRequest = json['am_i_sent_friend_request'];
//     isHeSentFriendRequest = json['is_he_sent_friend_request'];
//     ownRoom = json['own_room'] != null
//         ? new OwnRoom.fromJson(json['own_room'])
//         : null;
//     inRoom = json['in_room'];
//     wallet =
//     json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
//     senderLevel = json['sender_level'] != null
//         ? new SenderLevel.fromJson(json['sender_level'])
//         : null;
//     consigneeLevel = json['consignee_level'] != null
//         ? new SenderLevel.fromJson(json['consignee_level'])
//         : null;
//     time = json['time'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['uuid'] = this.uuid;
//     data['name'] = this.name;
//     data['gender'] = this.gender;
//     data['pio'] = this.pio;
//     data['image'] = this.image;
//     if (this.country != null) {
//       data['country'] = this.country.toJson();
//     }
//     data['balance'] = this.balance;
//     data['friends_count'] = this.friendsCount;
//     data['friend_requests_count'] = this.friendRequestsCount;
//     data['followers_count'] = this.followersCount;
//     data['followings_count'] = this.followingsCount;
//     data['visitors_count'] = this.visitorsCount;
//     data['new_visits_count'] = this.newVisitsCount;
//     data['is_followed'] = this.isFollowed;
//     data['is_friend'] = this.isFriend;
//     data['am_i_sent_friend_request'] = this.amISentFriendRequest;
//     data['is_he_sent_friend_request'] = this.isHeSentFriendRequest;
//     if (this.ownRoom != null) {
//       data['own_room'] = this.ownRoom.toJson();
//     }
//     data['in_room'] = this.inRoom;
//     if (this.wallet != null) {
//       data['wallet'] = this.wallet.toJson();
//     }
//     if (this.senderLevel != null) {
//       data['sender_level'] = this.senderLevel.toJson();
//     }
//     if (this.consigneeLevel != null) {
//       data['consignee_level'] = this.consigneeLevel.toJson();
//     }
//     data['time'] = this.time;
//     return data;
//   }
// }
//
// class Country {
//   int id;
//   String name;
//   String code;
//   String timeZone;
//   String flag;
//   String createdAt;
//   String updatedAt;
//
//   Country(
//       {this.id,
//         this.name,
//         this.code,
//         this.timeZone,
//         this.flag,
//         this.createdAt,
//         this.updatedAt});
//
//   Country.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     code = json['code'];
//     timeZone = json['time_zone'];
//     flag = json['flag'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['code'] = this.code;
//     data['time_zone'] = this.timeZone;
//     data['flag'] = this.flag;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class OwnRoom {
//   int id;
//   String name;
//   String intro;
//   Null note;
//   int totalIncome;
//   String cover;
//   Null background;
//   String frame;
//   String typeImage;
//   Null password;
//   String typeName;
//   bool hasPassword;
//   bool isUserRoomBlocked;
//   bool isUserRoomChatBlocked;
//   bool isUserRoomMicBlocked;
//   UserBlackListDetails userBlackListDetails;
//   bool isOwner;
//
//   OwnRoom(
//       {this.id,
//         this.name,
//         this.intro,
//         this.note,
//         this.totalIncome,
//         this.cover,
//         this.background,
//         this.frame,
//         this.typeImage,
//         this.password,
//         this.typeName,
//         this.hasPassword,
//         this.isUserRoomBlocked,
//         this.isUserRoomChatBlocked,
//         this.isUserRoomMicBlocked,
//         this.userBlackListDetails,
//         this.isOwner});
//
//   OwnRoom.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     intro = json['intro'];
//     note = json['note'];
//     totalIncome = json['total_income'];
//     cover = json['cover'];
//     background = json['background'];
//     frame = json['frame'];
//     typeImage = json['type_image'];
//     password = json['password'];
//     typeName = json['type_name'];
//     hasPassword = json['has_password'];
//     isUserRoomBlocked = json['is_user_room_blocked'];
//     isUserRoomChatBlocked = json['is_user_room_chat_blocked'];
//     isUserRoomMicBlocked = json['is_user_room_mic_blocked'];
//     userBlackListDetails = json['user_black_list_details'] != null
//         ? new UserBlackListDetails.fromJson(json['user_black_list_details'])
//         : null;
//     isOwner = json['is_owner'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['intro'] = this.intro;
//     data['note'] = this.note;
//     data['total_income'] = this.totalIncome;
//     data['cover'] = this.cover;
//     data['background'] = this.background;
//     data['frame'] = this.frame;
//     data['type_image'] = this.typeImage;
//     data['password'] = this.password;
//     data['type_name'] = this.typeName;
//     data['has_password'] = this.hasPassword;
//     data['is_user_room_blocked'] = this.isUserRoomBlocked;
//     data['is_user_room_chat_blocked'] = this.isUserRoomChatBlocked;
//     data['is_user_room_mic_blocked'] = this.isUserRoomMicBlocked;
//     if (this.userBlackListDetails != null) {
//       data['user_black_list_details'] = this.userBlackListDetails.toJson();
//     }
//     data['is_owner'] = this.isOwner;
//     return data;
//   }
// }
//
// class UserBlackListDetails {
//   Null room;
//   Null mic;
//   Null chat;
//
//   UserBlackListDetails({this.room, this.mic, this.chat});
//
//   UserBlackListDetails.fromJson(Map<String, dynamic> json) {
//     room = json['room'];
//     mic = json['mic'];
//     chat = json['chat'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['room'] = this.room;
//     data['mic'] = this.mic;
//     data['chat'] = this.chat;
//     return data;
//   }
// }
//
// class Wallet {
//   int id;
//   int userId;
//   String diamond;
//   String gold;
//   String silver;
//   String gameCoins;
//   String createdAt;
//   String updatedAt;
//   String usd;
//
//   Wallet(
//       {this.id,
//         this.userId,
//         this.diamond,
//         this.gold,
//         this.silver,
//         this.gameCoins,
//         this.createdAt,
//         this.updatedAt,
//         this.usd});
//
//   Wallet.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     diamond = json['diamond'];
//     gold = json['gold'];
//     silver = json['silver'];
//     gameCoins = json['game_coins'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     usd = json['usd'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['diamond'] = this.diamond;
//     data['gold'] = this.gold;
//     data['silver'] = this.silver;
//     data['game_coins'] = this.gameCoins;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['usd'] = this.usd;
//     return data;
//   }
// }
//
// class SenderLevel {
//   int currentNo;
//   String currentImage;
//   int nextNo;
//   String nextImage;
//   double value;
//
//   SenderLevel(
//       {this.currentNo,
//         this.currentImage,
//         this.nextNo,
//         this.nextImage,
//         this.value});
//
//   SenderLevel.fromJson(Map<String, dynamic> json) {
//     currentNo = json['current_no'];
//     currentImage = json['current_image'];
//     nextNo = json['next_no'];
//     nextImage = json['next_image'];
//     value = json['value'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['current_no'] = this.currentNo;
//     data['current_image'] = this.currentImage;
//     data['next_no'] = this.nextNo;
//     data['next_image'] = this.nextImage;
//     data['value'] = this.value;
//     return data;
//   }
// }