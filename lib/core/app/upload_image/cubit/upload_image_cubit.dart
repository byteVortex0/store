import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:store/core/utils/image_pick.dart';

part 'upload_image_state.dart';
part 'upload_image_cubit.freezed.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this.uploadImageRepo) : super(const UploadImageState.initial());

  final UploadImageRepo uploadImageRepo;

  String imageUrl = '';

  Future<void> uploadImage() async{

    final pickImage = await PickImageUtils().pickImage();
    if (pickImage == null) {
      return;
    }
    
    emit(const UploadImageState.loading());
    final result = await uploadImageRepo.uploadImage(imageFile: pickImage);

    result.when(success: (data) {
      imageUrl = data.location ?? '';

      emit(const UploadImageState.success());
    }, failure: (errorHandler) {
      emit(UploadImageState.error(errorMessage: errorHandler));
    },);
  }

  void removeImage(){
    imageUrl = '';
    emit(UploadImageState.removeImage(imageURL: imageUrl));
  }
}
