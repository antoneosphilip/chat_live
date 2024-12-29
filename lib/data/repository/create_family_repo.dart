import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:live_app/data/model/body/create_family_body.dart';

import '../../util/app_constants.dart';
import '../api/api_client.dart';

class CreateFamilyRepo
{
  final ApiClient apiClient;
  CreateFamilyRepo({required this.apiClient});

  Future<Response> createFamily(CreateFamilyBody createFamilyBody, XFile? pickedFile,XFile imagePerson) async {
    Map<String, String> body = {};
    body.addAll(<String, String>{
      'name': createFamilyBody.name,
      'introduce': createFamilyBody.introduction,
      'notice':createFamilyBody.logo,
    });
    return await apiClient.postMultipartData(AppConstants.createFamily,body, [MultipartBody('image', pickedFile??imagePerson)]);
  }



}
