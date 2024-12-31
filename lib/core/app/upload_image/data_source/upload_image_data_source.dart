import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store/core/app/upload_image/model/upload_image_response.dart';
import 'package:store/core/services/graphql/api_service.dart';

class UploadImageDataSource {
  final ApiService apiService;

  const UploadImageDataSource({required this.apiService});

  Future<UploadImageResponse> uploadImage({required XFile imageFile}) async {
    final formData = FormData();
    formData.files.add(
      MapEntry('file', await MultipartFile.fromFile(imageFile.path)),
    );
    final response = await apiService.uploadImage(formData);
    return response;
  }
}
