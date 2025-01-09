import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/extensions/string_extension.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/toast/show_toast.dart';

class UpdateproductsImage extends StatelessWidget {
  const UpdateproductsImage({
    super.key,
    required this.imagesList,
  });

  final List<String> imagesList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imagesList.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) =>
          BlocConsumer<UploadImageCubit, UploadImageState>(
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
          return state.maybeWhen(
            loadingList: (indexId) {
              if (indexId == index) {
                return Container(
                  height: 90.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              }
              return UpdateSelectedImage(
                imagesList: imagesList,
                index: index,
                onTap: () {},
              );
            },
            orElse: () {
              return UpdateSelectedImage(
                imagesList: imagesList,
                index: index,
                onTap: () {
                  context.read<UploadImageCubit>().updateUploadImageList(
                        index: index,
                        images: imagesList,
                      );
                },
              );
            },
          );
        },
      ),
      separatorBuilder: (context, index) => SizedBox(height: 6.h),
    );
  }
}

class UpdateSelectedImage extends StatelessWidget {
  const UpdateSelectedImage({
    super.key,
    required this.imagesList,
    required this.index,
    required this.onTap,
  });

  final List<String> imagesList;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.black.withOpacity(0.3),
        image: DecorationImage(
          image: NetworkImage(imagesList[index].imageProductFormate()),
          opacity: .7,
          fit: BoxFit.cover,
        ),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.add_a_photo_outlined,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
