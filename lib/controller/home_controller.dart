import 'package:get/get.dart';
import 'package:live_app/data/repository/home_repo.dart';

import '../data/api/api_checker.dart';
import '../data/model/response/banner_model.dart';
import '../data/model/response/country_model.dart';
import '../data/model/response/room_model.dart';

class HomeController extends GetxController implements GetxService {
  final HomeRepo repo = HomeRepo();
  bool isLoading = false;
  int page = 1;
  List<String> staticBannerImage=[
    "assets/images/room_type_game_select.png",
    "assets/images/room_type_game_select.png",
    "assets/images/room_type_game_select.png"
  ];
  List<Banner>? mainBanners = [];
  List<Banner>? liftBanners = [];
  List<Banner>? rightBanners = [];
  List<RoomModel>? topRooms = [];
  List<RoomModel>? homeRooms = [];
  List<CountryModel> countries = [];
  List<CountryModel> countriesStatic = [
    CountryModel(id: 1,code: '+20',flag: 'https://th.bing.com/th/id/OIP.4ve4zACsz1LZOlMcCUHGBAHaE8?rs=1&pid=ImgDetMain',name: "Egypt",),
    CountryModel(id: 2,code: '+213',flag: 'https://th.bing.com/th/id/OIP.N4uaOtrYPAN5QrYR-EqRmwHaE8?rs=1&pid=ImgDetMain',name: "Algeria",),
    CountryModel(id: 3,code: '+961',flag: 'https://th.bing.com/th/id/OIP.nXMnhi2Ncz1oLRJfLdGqAAHaE8?rs=1&pid=ImgDetMain',name: "Lebanon",),
    CountryModel(id: 4,code: '+20',flag: 'https://th.bing.com/th/id/OIP.4ve4zACsz1LZOlMcCUHGBAHaE8?rs=1&pid=ImgDetMain',name: "Egypt",),
    CountryModel(id: 5,code: '+213',flag: 'https://th.bing.com/th/id/OIP.N4uaOtrYPAN5QrYR-EqRmwHaE8?rs=1&pid=ImgDetMain',name: "Algeria",),
    CountryModel(id: 6,code: '+961',flag: 'https://th.bing.com/th/id/OIP.nXMnhi2Ncz1oLRJfLdGqAAHaE8?rs=1&pid=ImgDetMain',name: "Lebanon",),

  ];
  List<RoomModel> homeRoomsStatic = [
    RoomModel(
        id: 1,
        name: "Music Lovers",
        intro: "Welcome to the best music room!",
        note: "Please respect others",
        totalIncome: 5000,
        cover: "https://example.com/cover1.jpg",
        background: "https://example.com/bg1.jpg",
        frame: "https://example.com/frame1.png",
        type_name: "Music",
        type_image: "https://example.com/music-icon.png",
        hasPassword: false,
        isUserRoomBlocked: false,
        isUserRoomChatBlocked: false,
        isUserRoomMicBlocked: false,
        isOwner: true,
        adminsCount: 3,
        visitorsCount: 150,
        owner: Owner(
            id: 101,
            uuid: 1001,
            name: "John Doe",
            image: "https://example.com/user1.jpg",
            country: CountryModel(
                id: 1,
                name: "United States",
                code: "US",

            )
        ),
        chairs: [
          Chairs(
              id: 1,
              chairNo: 1,
              icon: "https://example.com/chair1.png",
              isLocked: 0,
              isMuted: 0,
              isFeatured: 1,
              isForAdmin: 1,
              teamNumber: 1,
              user: null
          ),
          Chairs(
              id: 2,
              chairNo: 2,
              icon: "https://example.com/chair2.png",
              isLocked: 0,
              isMuted: 1,
              isFeatured: 0,
              isForAdmin: 0,
              teamNumber: 1,
              user: null
          )
        ]
    ),

    RoomModel(
        id: 2,
        name: "Gaming Zone",
        intro: "Pro gamers hangout!",
        note: "No toxic behavior",
        totalIncome: 3500,
        cover: "https://example.com/cover2.jpg",
        background: "https://example.com/bg2.jpg",
        frame: "https://example.com/frame2.png",
        type_name: "Gaming",
        type_image: "https://example.com/gaming-icon.png",
        hasPassword: true,
        password: "123456",
        isUserRoomBlocked: false,
        isUserRoomChatBlocked: false,
        isUserRoomMicBlocked: false,
        isOwner: false,
        adminsCount: 2,
        visitorsCount: 75,
        owner: Owner(
            id: 102,
            uuid: 1002,
            name: "Jane Smith",
            image: "https://example.com/user2.jpg",
            country: CountryModel(
                id: 2,
                name: "United Kingdom",
                code: "UK",
                flag: "🇬🇧",

            )
        ),
        chairs: [
          Chairs(
              id: 3,
              chairNo: 1,
              icon: "https://example.com/chair3.png",
              isLocked: 1,
              isMuted: 0,
              isFeatured: 1,
              isForAdmin: 1,
              teamNumber: 1,
              user: null
          )
        ]
    ),

    RoomModel(
        id: 3,
        name: "Chat Café",
        intro: "Casual conversations and fun",
        note: null,
        totalIncome: 2000,
        cover: "https://example.com/cover3.jpg",
        background: null,
        frame: "https://example.com/frame3.png",
        type_name: "Social",
        type_image: "https://example.com/social-icon.png",
        hasPassword: false,
        isUserRoomBlocked: false,
        isUserRoomChatBlocked: false,
        isUserRoomMicBlocked: false,
        isOwner: false,
        adminsCount: 1,
        visitorsCount: 45,
        owner: Owner(
            id: 103,
            uuid: 1003,
            name: "Alex Johnson",
            image: "https://example.com/user3.jpg",
            country: CountryModel(
                id: 3,
                name: "Canada",
                code: "CA",
                flag: "🇨🇦",

            )
        ),
        chairs: []
    )
  ];


  bool dataFetched = false;
  bool hasMoreData=true;

  Future<void> getData() async {
    if (dataFetched == true) {
      hasMoreData=true;
      return;
    }
    isLoading = true;
    update();
    Response response = await repo.getData(page);
    if (response.statusCode == 200) {
      Map<String, dynamic> dataResponse = response.body['data'];
      // Parse main banners
      mainBanners = List<Banner>.from(
        dataResponse['main_banners'].map(
          (banner) => Banner.fromJson(banner),
        ),
      );
      // Parse lift banners
      liftBanners = List<Banner>.from(
        dataResponse['lift_banners'].map(
          (banner) => Banner.fromJson(banner),
        ),
      );
      // Parse right banners
      rightBanners = List<Banner>.from(
        dataResponse['right_banners'].map(
          (banner) => Banner.fromJson(banner),
        ),
      );
      // Parse top rooms
      topRooms = List<RoomModel>.from(
        dataResponse['top_rooms'].map(
          (room) => RoomModel.fromJson(room),
        ),
      );
      // Parse home rooms
      homeRooms = List<RoomModel>.from(
        dataResponse['home_rooms'].map(
          (room) => RoomModel.fromJson(room),
        ),
      );
      // Parse countries
      countries = List<CountryModel>.from(
        dataResponse['countries'].map(
          (country) => CountryModel.fromJson(country),
        ),
      );
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    dataFetched = true;
    update();
  }
///////////////////////////////
  Future<void> paginate(int pagenom) async {
    Response response = await repo.getData(pagenom);
    if (response.statusCode == 200) {

      Map<String, dynamic> dataResponse = response.body['data'];

      // Parse home rooms
      List<RoomModel> rooms = List<RoomModel>.from(
        dataResponse['home_rooms'].map(
          (room) => RoomModel.fromJson(room),
        ),
      );
      homeRooms?.addAll(rooms);
      // print("rooms${rooms[0].name}");

      if (rooms.isNotEmpty) {
        page = pagenom;
      }
      else
      {
        hasMoreData=false;
      }
      update();
    } else {
      ApiChecker.checkApi(response);
    }
  }
}
