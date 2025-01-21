import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';
import '../../../../../core/common/widgets/custom_product_item.dart';
import '../../../../../core/loading/empty_screen.dart';
import '../blocs/search_for_products/search_for_products_bloc.dart';
import '../widgets/filter_button.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        children: [
          const FilterButton(),
          SizedBox(height: 30.h),
          BlocBuilder<SearchForProductsBloc, SearchForProductsState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: context.color.textColor,
                  ),
                ),
                success: (data) => Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.w,
                      mainAxisSpacing: 15.h,
                      childAspectRatio: 165 / 250,
                    ),
                    itemBuilder: (context, index) => CustomProductsItem(
                      imageUrl: data[index].images!,
                      title: data[index].title ?? '',
                      price: data[index].price ?? 0.0,
                      categoryName: data[index].category!.name ?? '',
                      productId: int.parse(data[index].id ?? '0'),
                    ),
                  ),
                ),
                empty: EmptyScreen.new,
                error: Text.new,
              );
            },
          ),
        ],
      ),
    );
  }
}
