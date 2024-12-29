import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:live_app/data/model/response/get_all_families.dart';

import '../data/api/api_checker.dart';
import '../data/model/response/family_model.dart';
import '../data/repository/family_repo.dart';

class FamilyController extends GetxController implements GetxService {
  final FamilyRepo familyRepo;
  FamilyResponse? familyResponse;
  FamilyResponse familyResponseStatic = FamilyResponse(
      success: true,
      status: 200,
      message: "Family details retrieved successfully",
      data: Data(
          id: 1,
          name: "Smith Family",
          introduce: "A loving and caring family",
          notice: "Weekly family meeting on Sunday",
          image: "https://example.com/family.jpg",
          points: 1000,
          membersCount: 3,
          members: [],
          currentUserType: "admin",
          owner: Owner(
              id: 1,
              uuid: 12345,
              name: "John Smith",
              gender: "male",
              pio: "Family head",
              image: "https://example.com/john.jpg",
              balance: 500.0,
              friendsCount: 150,
              friendRequestsCount: 5,
              followersCount: 200,
              followingsCount: 180,
              visitorsCount: 50,
              newVisitsCount: 10,
              isFollowed: false,
              isFriend: true,
              amISentFriendRequest: false,
              isHeSentFriendRequest: false,
              ownRoom: OwnRoom(
                  id: 1,
                  name: "Smith's Living Room",
                  intro: "Welcome to our family room",
                  note: "Please keep it clean",
                  totalIncome: 1000,
                  cover: "https://example.com/cover.jpg",
                  background: "https://example.com/bg.jpg",
                  frame: "default",
                  typeImage: "family",
                  password: "1234",
                  typeName: "Family Room",
                  hasPassword: true,
                  isUserRoomBlocked: false,
                  isUserRoomChatBlocked: false,
                  isUserRoomMicBlocked: false,
                  isOwner: true,
                  userBlackListDetails: UserBlackListDetails(
                      room: "none",
                      mic: "none",
                      chat: "none"
                  )
              ),
              inRoom: null,
              wallet: Wallet(
                  id: 1,
                  userId: 12345,
                  diamond: "100",
                  gold: "500",
                  silver: "1000",
                  gameCoins: "2000",
                  createdAt: "2024-01-01",
                  updatedAt: "2024-01-26",
                  usd: "1000"
              ),
              senderLevel: SenderLevel(
                  currentNo: 5,
                  currentImage: "https://example.com/level5.jpg",
                  nextNo: 6,
                  nextImage: "https://example.com/level6.jpg",
                  value: 75.5
              ),
              consigneeLevel: SenderLevel(
                  currentNo: 3,
                  currentImage: "https://example.com/level3.jpg",
                  nextNo: 4,
                  nextImage: "https://example.com/level4.jpg",
                  value: 45.0
              ),

              time: null
          )
      )
  );

  String errorMessage='';
  GetAllFamilies? getAllFamilies;
  GetAllFamilies? getAllFamiliesStatic = GetAllFamilies(
    success: true,
    status: 200,
    message: "Families fetched successfully",
    familiesData: [
      FamiliesData(
        id: 1,
        name: "Family One",
        introduce: "This is Family One",
        notice: "Notice for Family One",
        image: "https://example.com/image1.png",
        points: 100,
        membersCount: 5,
      ),
      FamiliesData(
        id: 2,
        name: "Family Two",
        introduce: "This is Family Two",
        notice: "Notice for Family Two",
        image: "https://example.com/image2.png",
        points: 200,
        membersCount: 8,
      ),
    ],
  );

  bool isLoading = false;
  FamilyController({required this.familyRepo});
  Future<void> getFamilyData({int id=0}) async {
    Response response;
    isLoading = true;
    print("yessssss");

    if(id==0) {
      response = await familyRepo.getFamily();
    }
    else{
      response=await familyRepo.getFamilies(id: id);
    }

    if (response.statusCode == 200) {
      if (response.body != null && response.body.containsKey('data') && response.body['data'] != null) {
        Map<String, dynamic> familyResponseModel = response.body;
        familyResponse = FamilyResponse.fromJson(familyResponseModel);
        errorMessage = '';
      } else {
        print("errooooooor");
        ApiChecker.checkApi(response,isList: false);
      }
    } else {
      ApiChecker.checkApi(response,isList: false);
    }

    isLoading = false;
    update();
  }

  Future<void> getAllFamilyData() async {
    isLoading = true;

    Response response = await familyRepo.getAllFamilies();

    if (response.statusCode == 200) {
      print("yessssssss");
      if (response.body != null && response.body.containsKey('data') && response.body['data'] != null) {
        Map<String, dynamic> familyResponseModel = response.body;
        getAllFamilies = GetAllFamilies.fromJson(familyResponseModel);
        errorMessage = '';
      } else {
        ApiChecker.checkApi(response);
      }
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading = false;
    update();
  }

  Future<void> joinFamily({required familyId}) async {
    isLoading = true;

    Response response = await familyRepo.joinFamily(familyId: familyId);

    if (response.statusCode == 200) {
      errorMessage="join Successflly";
    }
    else
    {
      ApiChecker.checkApi(response,isList: false);
    }
    isLoading = false;
    update();
  }

  Future<void> leaveFamily() async {
    isLoading = true;

    Response response = await familyRepo.leaveFamily();

    if (response.statusCode == 200) {
      errorMessage="Leave Successflly";
    }
    else
    {
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();
  }


}