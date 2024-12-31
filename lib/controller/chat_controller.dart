import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/data/api/api_checker.dart';
import 'package:live_app/data/api/api_client.dart';
import 'package:live_app/data/model/body/notification_body.dart';
import 'package:live_app/data/model/response/chat_model.dart';
import 'package:live_app/data/model/response/conversation_model.dart';
import 'package:live_app/data/repository/chat_repo.dart';
import 'package:live_app/helper/date_converter.dart';
import 'package:live_app/helper/responsive_helper.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/util/messages.dart';
import 'package:live_app/view/base/custom_snackbar.dart';

class ChatController extends GetxController implements GetxService {
  final ChatRepo chatRepo;
  ChatController({required this.chatRepo});

  List<bool>? _showDate;
  bool _isSendButtonActive = false;
  final bool _isSeen = false;
  final bool _isSend = true;
  bool _isMe = false;
  bool _isLoading = false;
  final List<Message> _deliveryManMessage = [];
  final List<Message> _adminManMessage = [];
  List<XFile> _chatImage = [];
  List<Uint8List> _chatRawImage = [];
  ChatModel? _messageModel;
  ConversationsModel? _conversationModel;
  ConversationsModel? _searchConversationModel;
  bool _hasAdmin = true;
  NotificationBody? _notificationBody;
  int? _selectedIndex;
  String _type = 'vendor';
  bool _clickTab = false;

  bool get isLoading => _isLoading;
  List<bool>? get showDate => _showDate;
  bool get isSendButtonActive => _isSendButtonActive;
  bool get isSeen => _isSeen;
  bool get isSend => _isSend;
  bool get isMe => _isMe;
  List<Message> get deliveryManMessage => _deliveryManMessage;
  List<Message> get adminManMessages => _adminManMessage;
  List<XFile> get chatImage => _chatImage;
  List<Uint8List> get chatRawImage => _chatRawImage;
  ChatModel? get messageModel => _messageModel;
  ChatModel chatModelStatic = ChatModel(
    totalSize: 5,
    limit: 10,
    offset: 0,
    status: true,
    conversation: Conversation(
      id: 1,
      senderId: 101,
      senderType: "user",
      receiverId: 201,
      receiverType: "user",
      unreadMessageCount: 2,
      lastMessageId: 5,
      lastMessageTime: "2024-12-27 11:30:00",
      createdAt: "2024-12-27 09:00:00",
      updatedAt: "2024-12-27 11:30:00",
      sender: User(
          id: 101,
          fName: "Amira",
          lName: "Hassan",
          phone: "+20 1234567894",
          email: "amira.hassan@example.com",
          image: "users/amira_profile.jpg",
          createdAt: "2024-12-01 00:00:00",
          updatedAt: "2024-12-27 11:30:00"
      ),
      receiver: User(
          id: 201,
          fName: "Karim",
          lName: "Ahmed",
          phone: "+20 1234567895",
          email: "karim.ahmed@example.com",
          image: "users/karim_profile.jpg",
          createdAt: "2024-12-01 00:00:00",
          updatedAt: "2024-12-27 11:00:00"
      ),
    ),
    messages: [
      Message(
        id: 1,
        conversationId: 1,
        senderId: 101,
        message: "مرحباً كريم! كيف حالك؟",
        files: [],
        isSeen: 1,
        createdAt: "2024-12-27 09:00:00",
        updatedAt: "2024-12-27 09:00:00",
      ),
      Message(
        id: 2,
        conversationId: 1,
        senderId: 201,
        message: "أهلاً أميرة! أنا بخير الحمد لله. وأنتِ؟",
        files: [],
        isSeen: 1,
        createdAt: "2024-12-27 09:05:00",
        updatedAt: "2024-12-27 09:05:00",
      ),
      Message(
        id: 3,
        conversationId: 1,
        senderId: 101,
        message: "بخير الحمد لله. شوف الصور دي",
        files: ["images/photo1.jpg", "images/photo2.jpg"],
        isSeen: 1,
        createdAt: "2024-12-27 09:10:00",
        updatedAt: "2024-12-27 09:10:00",
      ),
      Message(
        id: 4,
        conversationId: 1,
        senderId: 201,
        message: "الصور جميلة جداً! 😊",
        files: [],
        isSeen: 1,
        createdAt: "2024-12-27 09:15:00",
        updatedAt: "2024-12-27 09:15:00",
      ),
      Message(
        id: 5,
        conversationId: 1,
        senderId: 101,
        message: "شكراً! عندي كمان صور حلوة هبعتهالك",
        files: [],
        isSeen: 0,
        createdAt: "2024-12-27 11:30:00",
        updatedAt: "2024-12-27 11:30:00",
      ),
    ],
  );
  ConversationsModel? get conversationModel => _conversationModel;
  ConversationsModel conversationsModelStatic = ConversationsModel(
    totalSize: 2,
    limit: 10,
    offset: 0,
    conversations: [
      Conversation(
        id: 1,
        senderId: 101,
        senderType: "user",
        receiverId: 201,
        receiverType: "user",
        unreadMessageCount: 3,
        lastMessageId: 1001,
        lastMessageTime: "2024-12-27 10:30:00",
        createdAt: "2024-12-25 08:00:00",
        updatedAt: "2024-12-27 10:30:00",
        sender: User(
            id: 101,
            fName: "Ahmed",
            lName: "Mohamed",
            phone: "+20 1234567890",
            email: "ahmed.mohamed@example.com",
            image: "https://www.bing.com/th?id=OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH&w=150&h=225&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
            createdAt: "2024-12-01 00:00:00",
            updatedAt: "2024-12-27 10:30:00"
        ),
        receiver: User(
            id: 201,
            fName: "Sara",
            lName: "Ali",
            phone: "+20 1234567891",
            email: "sara.ali@example.com",
            image: "users/sara_profile.jpg",
            createdAt: "2024-12-01 00:00:00",
            updatedAt: "2024-12-27 09:00:00"
        ),
        lastMessage: Message(
            id: 1001,
            conversationId: 1,
            senderId: 101,
            message: "مرحباً، كيف حالك؟",
            createdAt: "2024-12-27 10:30:00",
            updatedAt: "2024-12-27 10:30:00"
        ),
      ),
      Conversation(
        id: 2,
        senderId: 102,
        senderType: "user",
        receiverId: 202,
        receiverType: "user",
        unreadMessageCount: 1,
        lastMessageId: 1002,
        lastMessageTime: "2024-12-27 09:45:00",
        createdAt: "2024-12-26 14:00:00",
        updatedAt: "2024-12-27 09:45:00",
        sender: User(
            id: 102,
            fName: "Mahmoud",
            lName: "Hassan",
            phone: "+20 1234567892",
            email: "mahmoud.hassan@example.com",
            image: "https://www.bing.com/th?id=OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH&w=150&h=225&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
            createdAt: "2024-12-01 00:00:00",
            updatedAt: "2024-12-27 09:45:00"
        ),
        receiver: User(
            id: 202,
            fName: "Nour",
            lName: "Ibrahim",
            phone: "+20 1234567893",
            email: "nour.ibrahim@example.com",
            image: "users/nour_profile.jpg",
            createdAt: "2024-12-01 00:00:00",
            updatedAt: "2024-12-27 08:15:00"
        ),
        lastMessage: Message(
            id: 1002,
            conversationId: 2,
            senderId: 102,
            message: "شكراً جزيلاً على المساعدة",
            createdAt: "2024-12-27 09:45:00",
            updatedAt: "2024-12-27 09:45:00"
        ),
      ),
    ],
  );
  ConversationsModel? get searchConversationModel => _searchConversationModel;
  bool get hasAdmin => _hasAdmin;
  NotificationBody? get notificationBody => _notificationBody;
  int? get selectedIndex => _selectedIndex;
  String? get type => _type;
  bool get clickTab => _clickTab;

  void setType(String type) {
    _type = type;
    update();
  }

  void setTabSelect() {
    _clickTab = !_clickTab;
    // update();
  }

  Future<void> getConversationList(int offset, {String type = ''}) async {
    _hasAdmin = false;
    _searchConversationModel = null;
    Response response = await chatRepo.getConversationList(offset, type);

    if (response.statusCode == 200) {
      if (offset == 1) {
        _conversationModel = ConversationsModel.fromJson(response.body);
      } else {
        _conversationModel!.totalSize =
            ConversationsModel.fromJson(response.body).totalSize;
        _conversationModel!.offset =
            ConversationsModel.fromJson(response.body).offset;
        _conversationModel!.conversations!
            .addAll(ConversationsModel.fromJson(response.body).conversations!);
      }
      for (int index = 0;
          index < _conversationModel!.conversations!.length;
          index++) {
        if (_conversationModel!.conversations![index]!.receiverType ==
            AppConstants.admin) {
          _hasAdmin = true;
        }
      }
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> searchConversation(String name) async {
    _searchConversationModel = ConversationsModel();
    update();
    Response response = await chatRepo.searchConversationList(name);
    if (response.statusCode == 200) {
      _searchConversationModel = ConversationsModel.fromJson(response.body);
      int index0 = -1;
      late bool sender;
      for (int index = 0;
          index < _searchConversationModel!.conversations!.length;
          index++) {
        if (_searchConversationModel!.conversations![index]!.receiverType ==
            AppConstants.admin) {
          index0 = index;
          sender = false;
          break;
        } else if (_searchConversationModel!
                .conversations![index]!.receiverType ==
            AppConstants.admin) {
          index0 = index;
          sender = true;
          break;
        }
      }
      if (index0 != -1) {
        if (sender) {
          _searchConversationModel!.conversations![index0]!.sender = User(
            id: 0,
            fName: '',
            lName: '',
            phone: '',
            email: '',
            image: '',
          );
        } else {
          _searchConversationModel!.conversations![index0]!.receiver = User(
            id: 0,
            fName: '',
            lName: '',
            phone: '',
            email: '',
            image: '',
          );
        }
      }
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  void removeSearchMode() {
    _searchConversationModel = null;
    update();
  }

  Future<void> getMessages(int offset, NotificationBody? notificationBody,
      User? user, int? conversationID,
      {bool firstLoad = false}) async {
    Response? response;
    if (firstLoad) {
      _messageModel = null;
      _isSendButtonActive = false;
      _isLoading = false;
    }
    if (notificationBody == null || notificationBody.receiverType != null) {
      response = await chatRepo.getMessages(
          offset,
          notificationBody?.receiverId,
          "${notificationBody?.receiverType}",
          conversationID);
    }

    if (response != null &&
        response.body['messages'] != {} &&
        response.statusCode == 200) {
      if (offset == 1) {
        /// Unread-read
        if (conversationID != null && _conversationModel != null) {
          int index0 = -1;
          for (int index = 0;
              index < _conversationModel!.conversations!.length;
              index++) {
            if (conversationID ==
                _conversationModel!.conversations![index]!.id) {
              index0 = index;
              break;
            }
          }
          if (index0 != -1) {
            _conversationModel!.conversations![index0]!.unreadMessageCount = 0;
          }
        }

        if (Get.find<UserController>().userInfoModel == null) {
          await Get.find<UserController>().getUserInfo();
        }

        /// Manage Receiver
        _messageModel = ChatModel.fromJson(response.body);
        if (_messageModel!.conversation == null) {
          _messageModel!.conversation = Conversation(
              sender: User(
                id: Get.find<UserController>().userInfoModel!.id,
                image: Get.find<UserController>().userInfoModel!.image,
                fName: Get.find<UserController>().userInfoModel!.fName,
                lName: Get.find<UserController>().userInfoModel!.lName,
              ),
              receiver: notificationBody!.receiverType == AppConstants.admin
                  ? User(
                      id: 0,
                      fName: 'migo',
                      lName: '',
                      image: '',
                    )
                  : user);
        }
        _sortMessage(notificationBody!.receiverId);
      } else {
        _messageModel!.totalSize = ChatModel.fromJson(response.body).totalSize;
        _messageModel!.offset = ChatModel.fromJson(response.body).offset;
        _messageModel!.messages!
            .addAll(ChatModel.fromJson(response.body).messages!);
      }
    } else {
      print(response?.body);
      ApiChecker.checkApi(response!);
    }
    update();
  }

  void pickImage(bool isRemove) async {
    if (isRemove) {
      _chatImage = [];
      _chatRawImage = [];
    } else {
      List<XFile> imageFiles =
          await ImagePicker().pickMultiImage(imageQuality: 40);
      for (XFile xFile in imageFiles) {
        if (_chatImage.length >= 3) {
          showCustomSnackBar('can_not_add_more_than_3_image'.tr);
          break;
        } else {
          XFile file = await compressImage(xFile);
          _chatImage.add(file);
          _chatRawImage.add(await file.readAsBytes());
        }
      }
      _isSendButtonActive = true;
    }
    update();
  }

  void removeImage(int index, String messageText) {
    _chatImage.removeAt(index);
    _chatRawImage.removeAt(index);
    if (_chatImage.isEmpty && messageText.isEmpty) {
      _isSendButtonActive = false;
    }
    update();
  }

  Future<Response?> sendMessage(
      {required String message,
      required NotificationBody? notificationBody,
      required int? conversationID,
      required int? index}) async {
    Response? response;
    _isLoading = true;
    update();

    List<MultipartBody> myImages = [];
    for (var image in _chatImage) {
      myImages.add(MultipartBody('image[]', image));
    }

    response = await chatRepo.sendMessage(
        message,
        myImages,
        notificationBody?.receiverId,
        "${notificationBody?.receiverType}",
        conversationID);
    if (response.statusCode == 200) {
      _chatImage = [];
      _chatRawImage = [];
      _isSendButtonActive = false;
      _isLoading = false;
      _messageModel = ChatModel.fromJson(response.body);
      if (index != null && _searchConversationModel != null) {
        _searchConversationModel!.conversations![index]!.lastMessageTime =
            DateConverter.isoStringToLocalString(
                _messageModel!.messages![0].createdAt!);
      } else if (index != null && _conversationModel != null) {
        _conversationModel!.conversations![index]!.lastMessageTime =
            DateConverter.isoStringToLocalString(
                _messageModel!.messages![0].createdAt!);
      }
      if (_conversationModel != null &&
          !_hasAdmin &&
          (_messageModel!.conversation!.senderType == AppConstants.admin ||
              _messageModel!.conversation!.receiverType ==
                  AppConstants.admin) &&
          !ResponsiveHelper.isDesktop(Get.context)) {
        _conversationModel!.conversations!.add(_messageModel!.conversation);
        _hasAdmin = true;
      }
      if (Get.find<UserController>().userInfoModel!.userInfo == null) {
        Get.find<UserController>()
            .updateUserWithNewData(_messageModel!.conversation!.sender);
      }
      _sortMessage(notificationBody!.receiverId);
      Future.delayed(const Duration(seconds: 2), () {
        getMessages(1, notificationBody, null, conversationID);
      });
    }
    update();
    return response;
  }

  void _sortMessage(int? adminId) {
    if (_messageModel!.conversation != null &&
        (_messageModel!.conversation!.receiverType == AppConstants.user ||
            _messageModel!.conversation!.receiverType ==
                AppConstants.customer)) {
      User? receiver = _messageModel!.conversation!.receiver;
      _messageModel!.conversation!.receiver =
          _messageModel!.conversation!.sender;
      _messageModel!.conversation!.sender = receiver;
    }
    if (adminId != null) {
      _messageModel!.conversation!.receiver = User(
        id: 0,
        fName: '',
        lName: '',
        image: '',
      );
    }
  }

  void toggleSendButtonActivity() {
    _isSendButtonActive = !_isSendButtonActive;
    update();
  }

  void setIsMe(bool value) {
    _isMe = value;
  }

  void reloadConversationWithNotification(int conversationID) {
    int index0 = -1;
    Conversation? conversation;
    for (int index = 0;
        index < _conversationModel!.conversations!.length;
        index++) {
      if (_conversationModel!.conversations![index]!.id == conversationID) {
        index0 = index;
        conversation = _conversationModel!.conversations![index];
        break;
      }
    }
    if (index0 != -1) {
      _conversationModel!.conversations!.removeAt(index0);
    }
    conversation!.unreadMessageCount = conversation.unreadMessageCount! + 1;
    _conversationModel!.conversations!.insert(0, conversation);
    update();
  }

  void reloadMessageWithNotification(Message message) {
    _messageModel!.messages!.insert(0, message);
    update();
  }

  Future<XFile> compressImage(XFile file) async {
    final ImageFile input =
        ImageFile(filePath: file.path, rawBytes: await file.readAsBytes());
    final Configuration config = Configuration(
      outputType: ImageOutputType.webpThenPng,
      useJpgPngNativeCompressor: false,
      quality: (input.sizeInBytes / 1048576) < 2
          ? 50
          : (input.sizeInBytes / 1048576) < 5
              ? 30
              : (input.sizeInBytes / 1048576) < 10
                  ? 2
                  : 1,
    );
    final ImageFile output = await compressor
        .compress(ImageFileConfiguration(input: input, config: config));
    if (kDebugMode) {
      print('Input size : ${input.sizeInBytes / 1048576}');
      print('Output size : ${output.sizeInBytes / 1048576}');
    }
    return XFile.fromData(output.rawBytes);
  }

  void setNotificationBody(NotificationBody notificationBody) {
    _notificationBody = notificationBody;
    update();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    update();
  }
}
