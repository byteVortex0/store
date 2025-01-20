import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/extensions/string_extension.dart';

class ProductDetailsImageSlider extends StatefulWidget {
  const ProductDetailsImageSlider({super.key, required this.images});

  final List<String> images;

  @override
  State<ProductDetailsImageSlider> createState() =>
      _ProductDetailsImageSliderState();
}

class _ProductDetailsImageSliderState extends State<ProductDetailsImageSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 500,
      child: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 250.h,
              reverse: true,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
            itemCount: widget.images.length,
            itemBuilder: (context, index, realIndex) => CachedNetworkImage(
              imageUrl: widget.images[index].imageProductFormate(),
              // fit: BoxFit.fill,
              placeholder: (context, url) => const SizedBox.shrink(),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                size: 30,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.images.asMap().entries.map((url) {
              return Container(
                width: 15.w,
                height: 4.h,
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: activeIndex == url.key
                      ? context.color.bluePinkLight
                      : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
