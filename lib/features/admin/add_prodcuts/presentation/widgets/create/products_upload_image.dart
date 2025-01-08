import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/core/extensions/context_extension.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/toast/show_toast.dart';

class ProductsUploadImage extends StatelessWidget {
  const ProductsUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
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
        builder: (BuildContext context, UploadImageState state) {
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
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                    ),
                  ),
                );
              }
              return SelectYourProductImages(index: index, onTap: () {});
            },
            orElse: () => SelectYourProductImages(
                index: index,
                onTap: () {
                  context
                      .read<UploadImageCubit>()
                      .uploadImageList(index: index);
                }),
          );
        },
      ),
      separatorBuilder: (context, index) => SizedBox(height: 6.h),
    );
  }
}

class SelectYourProductImages extends StatelessWidget {
  const SelectYourProductImages({
    super.key,
    required this.index,
    required this.onTap,
  });

  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return context.read<UploadImageCubit>().imageList[index].isNotEmpty
        ? Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.black.withOpacity(0.3),
              image: DecorationImage(
                image: NetworkImage(
                  context.read<UploadImageCubit>().imageList[index],
                ),
                fit: BoxFit.cover,
              ),
            ),
          )
        : Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.black.withOpacity(0.3),
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
