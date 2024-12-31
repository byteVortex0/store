
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_image_response.g.dart';

@JsonSerializable()
class UploadImageResponse {
  final String? location;

  UploadImageResponse({required this.location});


  factory UploadImageResponse.fromJson(Map<String, dynamic> json) => 
      _$UploadImageResponseFromJson(json);
}