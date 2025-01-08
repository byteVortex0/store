import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateproductsImage extends StatelessWidget {
  const UpdateproductsImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => Container(
        height: 90.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.black.withOpacity(0.3),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            opacity: .7,
            fit: BoxFit.cover,
          ),
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add_a_photo_outlined,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(height: 6.h),
    );
  }
}
