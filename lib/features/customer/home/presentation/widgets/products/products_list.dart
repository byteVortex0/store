import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/widgets/custom_product_item.dart';
import '../../../../../admin/add_prodcuts/data/models/get_all_products_response.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.products});

  final GetAllProductsResponse products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 15.h,
          childAspectRatio: 165 / 250,
        ),
        itemBuilder: (context, index) => CustomProductsItem(
          imageUrl: products.getProductsList[index].images!,
          title: products.getProductsList[index].title!,
          price: products.getProductsList[index].price!,
          categoryName: products.getProductsList[index].category!.name!,
          productId: int.parse(products.getProductsList[index].id!),
        ),
      ),
    );
  }
}
