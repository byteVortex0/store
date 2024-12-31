import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/language/lang_keys.dart';
import 'package:store/core/toast/show_toast.dart';

import '../../../../../core/style/images/app_images.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 500,
      child: BlocConsumer<UploadImageCubit, UploadImageState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              ShowToast.showToastSuccessTop(
                message: context.trenslate(LangKeys.imageUploaded),
                seconds: 2,
              );
            },
            removeImage: (imageURL) {
              ShowToast.showToastSuccessTop(
                message: context.trenslate(LangKeys.imageRemoved),
                seconds: 2,
              );
            },
            error: (errorMessage) {
              ShowToast.showToastSuccessTop(
                message: errorMessage,
              );
            },
          );
        },
        builder: (context, state) {
          final isImageUploaded =
              context.read<UploadImageCubit>().imageUrl.isNotEmpty;

          return state.maybeWhen(
            loading: () {
              return CircleAvatar(
                radius: 38,
                backgroundImage: const AssetImage(AppImages.userAvatar),
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: context.color.mainColor,
                ),
              );
            },
            orElse: () {
              return CircleAvatar(
                radius: 38,
                backgroundImage: isImageUploaded
                    ? NetworkImage(context.read<UploadImageCubit>().imageUrl)
                        as ImageProvider
                    : const AssetImage(AppImages.userAvatar),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    if (isImageUploaded)
                      Positioned(
                        top: -15,
                        right: -15,
                        child: IconButton(
                          onPressed: () {
                            context.read<UploadImageCubit>().removeImage();
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    if (!isImageUploaded)
                      Container(
                        height: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.4),
                        ),
                        child: IconButton(
                          onPressed: () {
                            context.read<UploadImageCubit>().uploadImage();
                          },
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
