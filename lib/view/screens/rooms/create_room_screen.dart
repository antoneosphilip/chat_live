import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';
import 'package:live_app/data/model/response/room_model.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/view/widgets/custom_text_lable.dart';

import '../../../controller/auth_controller.dart';
import '../../../controller/user_controller.dart';
import '../../../data/model/response/response_model.dart';
import '../../../util/dimensions.dart';
import '../../base/custom_button.dart';
import '../../base/custom_snackbar.dart';
import '../../base/image_picker_widget.dart';
import '../../base/my_text_field.dart';
import '../profile/widget/profile_bg_widget.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final FocusNode _roomNameFocus = FocusNode();
  final FocusNode _roomIntroFocus = FocusNode();
  final TextEditingController _roomNameController = TextEditingController();
  final TextEditingController _roomIntroController = TextEditingController();

  @override
  void initState() {
    super.initState();

    initCall();
  }

  void initCall() {
    if (Get.find<AuthController>().isLoggedIn() &&
        Get.find<UserController>().userModel == null) {
      Get.find<UserController>().getUserData();
    }
    Get.find<UserController>().initData();
    Get.find<RoomController>().getRoomTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      endDrawerEnableOpenDragGesture: false,
      body: GetBuilder<RoomController>(builder: (roomController) {
        return ProfileBgWidget(
          title: 'create room',
          backButton: true,
          circularImage: ImagePickerWidget(
            image:
                "${AppConstants.mediaUrl}/profile/${Get.find<UserController>().userModel?.image}",
            onTap: () => roomController.pickImage(),
            rawFile: roomController.rawFile,
          ),
          mainWidget: Column(children: [
            Expanded(
                child: Scrollbar(
                    child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextLabel(
                            text: 'room type'.tr,
                            image: 'assets/image/other_icon.png',
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: GetBuilder<RoomController>(
                                builder: (RoomController controller) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ...controller.roomTypeList.map((type) {
                                        return InkWell(
                                          onTap: () {
                                            roomController.setTypeId(type.id);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Container(
                                              width: 100,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                      "${AppConstants.baseUrl}/${type.thumbnail}",
                                                    ),
                                                  ),
                                                  border: Border.all(
                                                      color: roomController
                                                                  .roomTypeId ==
                                                              type.id
                                                          ? Colors.yellow
                                                          : Colors.transparent),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Positioned(
                                                    bottom: 5,
                                                    child: Text(
                                                      "${type.name}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                                    ],
                                  );
                                },
                              )),
                        ],
                      ),
                    ),
                    CustomTextLabel(
                      text: 'room_name'.tr,
                      image: 'assets/image/user.png',
                      color: Colors.black,
                    ),
                    const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                    MyTextField(
                      hintText: 'room_name'.tr,
                      controller: _roomNameController,
                      focusNode: _roomNameFocus,
                      nextFocus: _roomIntroFocus,
                      inputType: TextInputType.name,
                      capitalization: TextCapitalization.words,
                    ),
                    const SizedBox(height: Dimensions.paddingSizeLarge),
                    CustomTextLabel(
                      text: 'room_intro'.tr,
                      image: 'assets/image/partial_pay.png',
                      color: Colors.black,
                    ),
                    const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                    MyTextField(
                      hintText: 'room_intro'.tr,
                      controller: _roomIntroController,
                      focusNode: _roomIntroFocus,
                      inputType: TextInputType.name,
                      capitalization: TextCapitalization.words,
                      maxLines: 5,
                    ),
                  ])),
            ))),
            Padding(
              padding: EdgeInsets.only(
                  bottom: GetPlatform.isIOS ? Dimensions.paddingSizeLarge : 0),
              child: CreateRoomButton(
                isLoading: roomController.isLoading,
                onPressed: () => _createRoom(roomController),
              ),
            ),
          ]),
        );
      }),
    );
  }

  void _createRoom(RoomController roomController) async {
    String roomName = _roomIntroController.text.trim();
    String roomIntro = _roomIntroController.text.trim();
    if (roomName.isEmpty) {
      showCustomSnackBar('enter_room_name'.tr);
    } else if (roomIntro.isEmpty) {
      showCustomSnackBar('enter_room_intro'.tr);
    } else {
      RoomModel createdRoom = RoomModel(name: roomName, intro: roomIntro);
      ResponseModel responseModel = await roomController.createRoom(
          createdRoom, Get.find<AuthController>().getUserToken());
      if (responseModel.isSuccess) {
        showCustomSnackBar('room_created_successfully'.tr, isError: false);
      } else {
        showCustomSnackBar(responseModel.message);
      }
    }
  }
}

class CreateRoomButton extends StatelessWidget {
  final bool isLoading;
  final Function onPressed;
  const CreateRoomButton(
      {Key? key, required this.isLoading, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? CustomButton(
            onPressed: onPressed,
            margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            buttonText: 'create'.tr,
          )
        : const Center(child: CircularProgressIndicator());
  }
}
