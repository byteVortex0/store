import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';

import '../../../../../../core/app/upload_image/cubit/upload_image_cubit.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/toast/show_toast.dart';

class UpdateUploadImage extends StatelessWidget {
  const UpdateUploadImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () => ShowToast.showToastSuccessTop(
            message: context.translate(LangKeys.imageUploaded),
          ),
          error: (errorMessage) => ShowToast.showToastErrorTop(
            message: errorMessage,
          ),
        );
      },
      builder: (context, state) {
        final cubit = context.read<UploadImageCubit>();
        return state.maybeWhen(
          loading: () => Container(
            height: 120.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ),
            ),
          ),
          orElse: () => cubit.imageUrl.isNotEmpty
              ? InkWell(
                  onTap: () {
                    cubit.uploadImage();
                  },
                  child: Container(
                    height: 120.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15.r),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(cubit.imageUrl),
                      ),
                    ),
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      size: 50,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    cubit.uploadImage();
                  },
                  child: Container(
                    height: 120.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15.r),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        opacity: .4,
                        image: NetworkImage(imageUrl),
                      ),
                    ),
                    child: const Icon(
                      Icons.add_a_photo_outlined,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
