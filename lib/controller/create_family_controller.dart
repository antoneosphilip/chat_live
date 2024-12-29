import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image/image.dart' as img; // Import the image package
import 'package:image_picker/image_picker.dart';
import 'package:live_app/data/api/api_checker.dart';
import '../data/model/body/create_family_body.dart';
import '../data/repository/create_family_repo.dart';
import '../helper/network_info.dart';

class CreateFamilyController extends GetxController implements GetxService {
  final CreateFamilyRepo createFamilyRepo;
  bool isLoading = false;

  CreateFamilyController({required this.createFamilyRepo});

  String? imagePath;
  var nameController = TextEditingController();
  var introduce = TextEditingController();
  var logo = TextEditingController();
  final formKey = GlobalKey<FormState>();

  XFile? pickedFile;
  Uint8List? rawFile;

  void pickImage() async {
    try {
      pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        // Compress the image
        var compressedFile = await NetworkInfo.compressImage(pickedFile!);

        // Read the compressed file as bytes
        Uint8List imageBytes = await compressedFile.readAsBytes();

        // Decode the image
        img.Image? image = img.decodeImage(imageBytes);
        if (image != null) {
          // Encode the image as PNG
          Uint8List pngBytes = img.encodePng(image);

          // Save the PNG image to a temporary file
          File tempFile = File('${Directory.systemTemp.path}/temp_image.png');
          await tempFile.writeAsBytes(pngBytes);

          // Update the path and rawFile
          imagePath = tempFile.path;
          rawFile = pngBytes;
        } else {
          print('Failed to decode image.');
        }
      } else {
        print('No image selected.');
      }
      update();
    } catch (e) {
      print('Error picking or processing image: $e');
    }
  }

  Future<void> createFamily() async {
    isLoading = true;
    update();
    if (pickedFile != null && imagePath != null) {
      Response response = await createFamilyRepo.createFamily(
        CreateFamilyBody(
          name: nameController.text,
          introduction: introduce.text,
          logo: logo.text,
        ),
        pickedFile, // Passing the original file if needed
        XFile(imagePath!), // Passing the path of the PNG image
      );
      if (response.status.code == 200) {
        nameController.clear();
        introduce.clear();
        logo.clear();

        // Handle successful response
      } else {
        ApiChecker.checkApi(response);
      }
    } else {
      print('Image file or path is missing.');
    }
    isLoading = false;
    update();
  }

  bool checkNameFilled = false;
  bool checkIntroduceFilled = false;

  void checkIfNameFilled() {
    nameController.addListener(() {
      checkNameFilled = nameController.text.isNotEmpty;
      update();
    });
  }

  void checkIfIntroduceFilled() {
    introduce.addListener(() {
      checkIntroduceFilled = introduce.text.isNotEmpty;
      update();
    });
  }
}
