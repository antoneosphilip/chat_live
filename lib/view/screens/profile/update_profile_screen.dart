// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:live_app/controller/auth_controller.dart';
// import 'package:live_app/controller/user_controller.dart';
// import 'package:live_app/data/model/response/response_model.dart';
// import 'package:live_app/data/model/response/userinfo_model.dart';
// import 'package:live_app/helper/responsive_helper.dart';
// import 'package:live_app/util/dimensions.dart';
// import 'package:live_app/view/base/custom_button.dart';
// import 'package:live_app/view/base/custom_snackbar.dart';
// import 'package:live_app/view/base/image_picker_widget.dart';
// import 'package:live_app/view/screens/profile/widget/profile_bg_widget.dart';
//
// class UpdateProfileScreen extends StatefulWidget {
//   const UpdateProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
// }
//
// class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
//   final FocusNode _firstNameFocus = FocusNode();
//   final FocusNode _lastNameFocus = FocusNode();
//   final FocusNode _emailFocus = FocusNode();
//   final FocusNode _phoneFocus = FocusNode();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//
//     initCall();
//   }
//
//   void initCall() {
//     if (Get.find<AuthController>().isLoggedIn() &&
//         Get.find<UserController>().userInfoModel == null) {
//       Get.find<UserController>().getUserInfo();
//     }
//     Get.find<UserController>().initData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).cardColor,
//       endDrawerEnableOpenDragGesture: false,
//       body: GetBuilder<UserController>(builder: (userController) {
//         bool isLoggedIn = Get.find<AuthController>().isLoggedIn();
//         if (userController.userInfoModel != null &&
//             _phoneController.text.isEmpty) {
//           _firstNameController.text = userController.userInfoModel!.fName ?? '';
//           _lastNameController.text = userController.userInfoModel!.lName ?? '';
//           _phoneController.text = userController.userInfoModel!.phone ?? '';
//           _emailController.text = userController.userInfoModel!.email ?? '';
//         }
//
//         return isLoggedIn
//             ? userController.userInfoModel != null
//                 ? ProfileBgWidget(
//                     backButton: true,
//                     circularImage: ImagePickerWidget(
//                       image: '',
//                       onTap: () => userController.pickImage(),
//                       rawFile: userController.rawFile,
//                     ),
//                     mainWidget: Column(children: [
//                       Expanded(
//                           child: Scrollbar(
//                               child: SingleChildScrollView(
//                         physics: const BouncingScrollPhysics(),
//                         padding: ResponsiveHelper.isDesktop(context)
//                             ? EdgeInsets.zero
//                             : const EdgeInsets.all(Dimensions.paddingSizeSmall),
//                         child: Center(),
//                       ))),
//                       ResponsiveHelper.isDesktop(context)
//                           ? const SizedBox.shrink()
//                           : Padding(
//                               padding: EdgeInsets.only(
//                                   bottom: GetPlatform.isIOS
//                                       ? Dimensions.paddingSizeLarge
//                                       : 0),
//                               child: UpdateProfileButton(
//                                   isLoading: userController.isLoading,
//                                   onPressed: () =>
//                                       _updateProfile(userController)),
//                             ),
//                     ]),
//                   )
//                 : const Center(child: CircularProgressIndicator())
//             : Container();
//       }),
//     );
//   }
//
//   void _updateProfile(UserController userController) async {
//     String firstName = _firstNameController.text.trim();
//     String lastName = _lastNameController.text.trim();
//     String email = _emailController.text.trim();
//     String phoneNumber = _phoneController.text.trim();
//     if (userController.userInfoModel!.fName == firstName &&
//         userController.userInfoModel!.lName == lastName &&
//         userController.userInfoModel!.phone == phoneNumber &&
//         userController.userInfoModel!.email == _emailController.text &&
//         userController.pickedFile == null) {
//       showCustomSnackBar('change_something_to_update'.tr);
//     } else if (firstName.isEmpty) {
//       showCustomSnackBar('enter_your_first_name'.tr);
//     } else if (lastName.isEmpty) {
//       showCustomSnackBar('enter_your_last_name'.tr);
//     } else if (email.isEmpty) {
//       showCustomSnackBar('enter_email_address'.tr);
//     } else if (!GetUtils.isEmail(email)) {
//       showCustomSnackBar('enter_a_valid_email_address'.tr);
//     } else if (phoneNumber.isEmpty) {
//       showCustomSnackBar('enter_phone_number'.tr);
//     } else if (phoneNumber.length < 6) {
//       showCustomSnackBar('enter_a_valid_phone_number'.tr);
//     } else {
//       UserInfoModel updatedUser = UserInfoModel(
//           fName: firstName, lName: lastName, email: email, phone: phoneNumber);
//       ResponseModel responseModel = await userController.updateUserInfo(
//           updatedUser, );
//       // Get.find<AuthController>().getUserToken()
//       if (responseModel.isSuccess) {
//         showCustomSnackBar('profile_updated_successfully'.tr, isError: false);
//       } else {
//         showCustomSnackBar(responseModel.message);
//       }
//     }
//   }
// }
//
// class UpdateProfileButton extends StatelessWidget {
//   final bool isLoading;
//   final Function onPressed;
//   const UpdateProfileButton(
//       {Key? key, required this.isLoading, required this.onPressed})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return !isLoading
//         ? CustomButton(
//             onPressed: onPressed,
//             margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//             buttonText: 'update'.tr,
//           )
//         : const Center(child: CircularProgressIndicator());
//   }
// }
