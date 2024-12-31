// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_picker/image_picker.dart';
import 'package:store/core/app/upload_image/data_source/upload_image_data_source.dart';
import 'package:store/core/app/upload_image/model/upload_image_response.dart';
import 'package:store/core/services/graphql/api_result.dart';
import 'package:store/core/utils/app_strings.dart';

class UploadImageRepo {
  UploadImageDataSource uploadImageDataSource;
  UploadImageRepo({
    required this.uploadImageDataSource,
  });

  Future<ApiResult<UploadImageResponse>> uploadImage(
      {required XFile imageFile}) async {
    try {
      final response =
          await uploadImageDataSource.uploadImage(imageFile: imageFile);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
}
