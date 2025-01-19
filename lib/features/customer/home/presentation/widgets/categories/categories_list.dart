import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/string_extension.dart';
import 'package:store/features/admin/add_categories/data/models/get_all_categories_response.dart';

import 'category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.categories});

  final GetAllCategoriesResponse categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
      child: SizedBox(
        height: 125.h,
        child: ListView.separated(
          itemCount: categories.getCategoriesList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CategoryItem(
            title: categories.getCategoriesList[index].name!,
            image: categories.getCategoriesList[index].image!
                .imageProductFormate(),
          ),
          separatorBuilder: (context, index) => SizedBox(width: 15.w),
        ),
      ),
    );
  }
}
