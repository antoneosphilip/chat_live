import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:live_app/controller/auth_controller.dart';
import 'package:live_app/data/api/api_checker.dart';
import 'package:live_app/data/model/response/conversation_model.dart';
import 'package:live_app/data/model/response/gift_model.dart';
import 'package:live_app/data/model/response/response_model.dart';
import 'package:live_app/data/model/response/user_details_model.dart';
import 'package:live_app/data/model/response/user_model.dart';
import 'package:live_app/data/model/response/userinfo_model.dart';
import 'package:live_app/data/repository/user_repo.dart';
import 'package:live_app/helper/network_info.dart';
import 'package:live_app/helper/route_helper.dart';
import 'package:live_app/view/base/custom_snackbar.dart';
import 'package:live_app/view/widgets/flutter_Show_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/response/country_model.dart';
import '../data/model/response/update_profile_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  UserInfoModel? _userInfoModel;
  UserModel? userModel;
  UserModel? userModelStatic = UserModel(
    id: 1,
    name: "test",
    image: "https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?rs=1&pid=ImgDetMain",
    pio: "This is a test bio",
    gender: "male",
    balance: 100.0,
    country: CountryModel(
      id: 1,
      name: "Egypt",
      flag: "assets/flags/egypt.svg",
      code: "+020",
    ),
    friendsCount: 10,
    friendRequestsCount: 5,
    uuid: 23455,
    followersCount: 100,
    followingsCount: 50,
    visitorsCount: 20,
    newVisitsCount: 2,
    isFollowed: true,
    isFriend: false,
    amISentFriendRequest: false,
    isHeSentFriendRequest: true,
    // ownRoom: RoomModel(
    //   id: 1,
    //   name: "Test Room",
    // ),
    // inRoom: RoomModel(
    //   id: 2,
    //   name: "Another Room",
    // ),
    wallet: WalletModel(
      id: 1,
      userId: 1,
      diamond: "50",
      gold: "100",
      silver: "200",
      gameCoins: "500",
      usd: "20",
    ),
    senderLevel: Level(
      currentNo: 5,
      currentImage: "https://th.bing.com/th/id/OIP.Ikqx6WLZ7jyCTR2encqBiwHaE8?rs=1&pid=ImgDetMain",
      nextNo: 6,
      nextImage: "assets/levels/level6.png",
      value: 75.0,
    ),
    consigneeLevel: Level(
      currentNo: 3,
      currentImage: "https://th.bing.com/th/id/OIP.Ikqx6WLZ7jyCTR2encqBiwHaE8?rs=1&pid=ImgDetMain",
      nextNo: 4,
      nextImage: "assets/levels/level4.png",
      value: 50.0,
    ),
    time: "2024-12-24T10:00:00Z",
    family: FamilyModel(
      id: 1,
      name: "Test Family",
      introduce: "Welcome to our family",
      notice: "Family notice here",
      image: "https://th.bing.com/th/id/R.0973e118e3a625d59593832bb25b5394?rik=yuhldWToTI0How&pid=ImgRaw&r=0",
      points: 100,
      membersCount: 15,
    ),
    receivedGifts: [
      GiftModel(
        id: 1,
        name: "Gift 1",
        image: "assets/gifts/gift1.png",
        points: 10,
      ),
    ],
    sentGifts: [
      GiftModel(
        id: 2,
        name: "Gift 2",
        image: "assets/gifts/gift2.png",
        points: 20,
      ),
    ],
    wealth: "Rich",
    charm: "High",
    topSupporters: [
      UserModel(
        id: 2,
        name: "Supporter 1",
        image: "https://th.bing.com/th/id/R.0973e118e3a625d59593832bb25b5394?rik=yuhldWToTI0How&pid=ImgRaw&r=0",
      ),
    ],
    hasFamily: true,
  );

  UserDetailsModel? userDetailsModel;
  UserDetailsModel? userDetailsModelStatic = UserDetailsModel(
      id: 1001,
      uuid: 5001,
      name: "Ahmed Hassan",
      gender: "male",
      pio: "Living life to the fullest 🌟",
      image: "https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?rs=1&pid=ImgDetMain",
      country: Country(
          id: 1,
          name: "Egypt",
          code: "EG",
          timeZone: "Africa/Cairo",
          flag: "🇪🇬",
          createdAt: "2024-01-01 00:00:00",
          updatedAt: "2024-01-01 00:00:00"
      ),
      friendsCount: 250,
      friendRequestsCount: 15,
      followersCount: "1.2K",
      followingsCount: "890",
      visitorsCount: "5.6K",
      newVisitsCount: 8,
      isFollowed: true,
      isFriend: false,
      amISentFriendRequest: true,
      isHeSentFriendRequest: false,
      ownRoom: OwnRoom(
          id: 2001,
          name: "Ahmed's Chill Room",
          intro: "Welcome to my space!",
          note: "Be respectful and have fun",
          totalIncome: 15000,
          cover: "https://example.com/room-cover.jpg",
          background: "https://example.com/room-bg.jpg",
          typeImage: "https://example.com/type-image.png",
          password: null,
          typeName: "Public Room",
          hasPassword: false,
          isUserRoomBlocked: false,
          isUserRoomChatBlocked: false,
          isUserRoomMicBlocked: false,
          isOwner: true,
          userBlackListDetails: UserBlackListDetails(
              room: "0",
              mic: "0",
              chat: "0"
          )
      ),
      wallet: Wallet(
          id: 3001,
          userId: 1001,
          diamond: "5000",
          gold: "10000",
          silver: "25000",
          gameCoins: "7500",
          createdAt: "2024-01-01 00:00:00",
          updatedAt: "2024-01-01 00:00:00"
      ),
      senderLevel: SenderLevel(
          currentNo: 5,
          currentImage: "https://th.bing.com/th/id/OIP._vR-Bv_8LLQWY8hf2HRKhAHaE7?rs=1&pid=ImgDetMain",
          nextNo: 6,
          nextImage: "https://example.com/level6.png",
          value: 75.5
      ),
      consigneeLevel: SenderLevel(
          currentNo: 3,
          currentImage: "https://th.bing.com/th/id/OIP._vR-Bv_8LLQWY8hf2HRKhAHaE7?rs=1&pid=ImgDetMain",
          nextNo: 4,
          nextImage: "https://example.com/level4.png",
          value: 45.2
      ),
      receivedGifts: [
        ReceivedGifts(
            giftId: 101,
            thumbnail: "https://th.bing.com/th/id/OIP._vR-Bv_8LLQWY8hf2HRKhAHaE7?rs=1&pid=ImgDetMain",
            price: "500",
            totalQty: "10"
        ),
        ReceivedGifts(
            giftId: 102,
            thumbnail: "https://th.bing.com/th/id/OIP._vR-Bv_8LLQWY8hf2HRKhAHaE7?rs=1&pid=ImgDetMain",
            price: "1000",
            totalQty: "5"
        )
      ],
      sentGifts: [
        SentGifts(
            giftId: 201,
            thumbnail: "https://th.bing.com/th/id/OIP._vR-Bv_8LLQWY8hf2HRKhAHaE7?rs=1&pid=ImgDetMain",
            price: "750",
            totalQty: "8"
        ),
        SentGifts(
            giftId: 202,
            thumbnail:"https://th.bing.com/th/id/OIP._vR-Bv_8LLQWY8hf2HRKhAHaE7?rs=1&pid=ImgDetMain",
            price: "1500",
            totalQty: "3"
        )
      ],
      wealth: "50000",
      charm: "35000",
      topSupporters: []  // You can add UserModel instances here if needed
  );
  int? userDetailsId;
  XFile? _pickedFile;
  Uint8List? _rawFile;
  bool _isLoading = false;
  final TextEditingController pioController = TextEditingController();
   UserInfoModel userInfoStatic = UserInfoModel(
    id: 1,
    uuid: 123456,
    fName: "John",
    lName: "Doe",
    email: "john.doe@example.com",
    image: "https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?rs=1&pid=ImgDetMain",
    phone: "+1234567890",
    createdAt: "2024-12-01",
    password: "password123",
    memberSinceDays: 365,
    walletBalance: 150.75,
    loyaltyPoint: 120,
    refCode: "REF123",
    socialId: "SOCIAL123",
    hasRoom: true,
    userInfo: User(
      id: 101,
      fName: "Sample",
      image: "https://www.bing.com/th?id=OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH&w=150&h=225&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
      email: 'test@gmail.com',
      lName: "User",
      phone: '010000'
    ),
  );
  UserInfoModel? get userInfoModel => _userInfoModel;
  XFile? get pickedFile => _pickedFile;
  Uint8List? get rawFile => _rawFile;
  bool get isLoading => _isLoading;
  var nameController=TextEditingController();

  Future<Map<String, dynamic>> follow(int user_id) async {
    Map<String, dynamic> data = {};
    Response response = await userRepo.follow(user_id);
    if (response.statusCode == 200) {
      data = response.body['data'];
    } else {
      ApiChecker.checkApi(response);
    }
    return data;
  }

  Future<Map<String, dynamic>> unfollow(int user_id) async {
    Map<String, dynamic> data = {};
    Response response = await userRepo.unfollow(user_id);
    if (response.statusCode == 200) {
      data = response.body['data'];
    } else {
      ApiChecker.checkApi(response);
    }
    return data;
  }

  void setUserDetailsModel(String key, dynamic value) {
    switch (key) {
      case 'isFollowed':
        userDetailsModel?.isFollowed = value;
        break;
      case 'isFriend':
        userDetailsModel?.isFriend = value;
        break;
      default:
        break;
    }
    update();
  }

  Future<ResponseModel> getUserInfo() async {
    print("infooooooooo");
    _pickedFile = null;
    _rawFile = null;
    ResponseModel responseModel;
    Response response = await userRepo.getUserInfo();
    if (response.statusCode == 200) {
      _userInfoModel = UserInfoModel.fromJson(response.body);
      responseModel = ResponseModel(true, 'successful');
    } else {
      responseModel = ResponseModel(false, response.statusText);
      ApiChecker.checkApi(response,isList: false);
    }
    update();
    return responseModel;
  }

  Future<ResponseModel> getUserData() async {
    print("getttttttttttttt");

    ResponseModel responseModel;
    Response response = await userRepo.getUserData();
    if (response.statusCode == 200) {
      userModel = UserModel.fromJson(response.body['data']);
      responseModel = ResponseModel(true, 'successful');
    } else {
      responseModel = ResponseModel(false, response.statusText);
      ApiChecker.checkApi(response,isList: false);
    }
    update();
    return responseModel;
  }

  Future<void> getUserDetails(int user_id) async {
    print("datttttttttttttta");
    if (userDetailsModel != null && userDetailsId == user_id) {
      return;
    }
    _isLoading = true;
    update();
    Response response = await userRepo.getUserDetails(user_id);

    if (response.statusCode == 200) {
      userDetailsModel = UserDetailsModel.fromJson(response.body['data']);
      print('nammmmmmmmmmme ${userDetailsModel?.name}');
    } else {
      print("errrrrrrrrrrrr");
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    userDetailsId = user_id;
    update();
  }

  void setForceFullyUserEmpty() {
    _userInfoModel = null;
  }
  Future<void> updateUserInfo(
      UpdateProfileModel updateProfileModel,{bool? isBack}) async {
    if(isBack??true){
      Get.back();
    }
    userDetailsModel=null;
    _isLoading = true;
    update();
    Response response =
        await userRepo.updateProfile(updateProfileModel,_pickedFile);
    _isLoading = false;
    if (response.statusCode == 200) {
      print("succcccccccesss");
      // _userInfoModel = updateProfileModel;
      // _pickedFile = null;
      // _rawFile = null;
      getUserInfo();
      getUserDetails(userModel!.id!);
      nameController.clear();
      flutterShowToast(message:'updated Successfully', toastCase: ToastCase.success);
    } else {
      print("erooooooooooooor");
      // responseModel = ResponseModel(false, response.statusText);
      ApiChecker.checkApi(response,isList: false);
    }
    update();
  }

  Future<ResponseModel> changePassword(UserInfoModel updatedUserModel) async {
    _isLoading = true;
    update();
    ResponseModel responseModel;
    Response response = await userRepo.changePassword(updatedUserModel);
    _isLoading = false;
    if (response.statusCode == 200) {
      String? message = response.body["message"];
      responseModel = ResponseModel(true, message);
    } else {
      responseModel = ResponseModel(false, response.statusText);
    }
    update();
    return responseModel;
  }

  void updateUserWithNewData(User? user) {
    _userInfoModel!.userInfo = user;
  }
  XFile? image;

  void pickImage() async {
    _pickedFile = await ImagePicker().pickImage(source:ImageSource.gallery);
    if (_pickedFile != null) {
      _pickedFile = await NetworkInfo.compressImage(_pickedFile!);
      _rawFile = await _pickedFile!.readAsBytes();
    }
    image=pickedFile;
    update();
  }
  void pickImageUpdateProfile(ImageSource?imageSource) async {
    _pickedFile = await ImagePicker().pickImage(source:imageSource??ImageSource.gallery);
    if (_pickedFile != null) {
      Get.back();
      updateUserInfo(UpdateProfileModel(),isBack: false);
      _pickedFile = await NetworkInfo.compressImage(_pickedFile!);
      _rawFile = await _pickedFile!.readAsBytes();
    }
    image=pickedFile;
    update();
  }

  void initData({bool isUpdate = false}) {
    _pickedFile = null;
    _rawFile = null;
    if (isUpdate) {
      update();
    }
  }

  Future removeUser() async {
    _isLoading = true;
    update();
    Response response = await userRepo.deleteUser();
    _isLoading = false;
    if (response.statusCode == 200) {
      showCustomSnackBar('your_account_remove_successfully'.tr);
      Get.find<AuthController>().clearSharedData();
      Get.offAllNamed(RouteHelper.getSignInRoute(RouteHelper.splash));
    } else {
      Get.back();
      ApiChecker.checkApi(response);
    }
  }



  void clearUserInfo() {
    _userInfoModel = null;
    userModel = null;
    update();
  }
}
