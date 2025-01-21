import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/features/customer/products_view_all/presentation/blocs/products_view_all/products_view_all_bloc.dart';

import '../../../../../core/common/widgets/custom_product_item.dart';
import '../../../../../core/loading/loading_shimmer.dart';
import '../blocs/products_view_all/products_view_all_state.dart';

class ProductsViewAllBody extends StatefulWidget {
  const ProductsViewAllBody({super.key});

  @override
  State<ProductsViewAllBody> createState() => _ProductsViewAllBodyState();
}

class _ProductsViewAllBodyState extends State<ProductsViewAllBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        context.read<ProductsViewAllBloc>().handlerPosition(
              controller: _scrollController,
              loadingMorePosition: MediaQuery.of(context).size.height * 0.15,
            );
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<ProductsViewAllBloc, ProductsViewAllState>(
        builder: (context, state) {
          if (state is ProductsViewAllLoadingState &&
              state.productsList.isEmpty) {
            return GridView.builder(
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
              itemBuilder: (context, index) => LoadingShimmer(
                height: 250.h,
                width: 165.w,
              ),
            );
          } else if (state is ProductsViewAllErrorState) {
            return Center(child: Text(state.errorMassage));
          } else {
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: state.productsList.length,
                    controller: _scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.w,
                      mainAxisSpacing: 15.h,
                      childAspectRatio: 165 / 250,
                    ),
                    itemBuilder: (context, index) => CustomProductsItem(
                      imageUrl: state.productsList[index].images!,
                      title: state.productsList[index].title ?? '',
                      price: state.productsList[index].price ?? 0.0,
                      categoryName:
                          state.productsList[index].category!.name ?? '',
                      productId: int.parse(state.productsList[index].id ?? '0'),
                    ),
                  ),
                ),
                if (state is ProductsViewAllLoadingState &&
                    state.productsList.isNotEmpty)
                  const Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                    ),
                  ),
              ],
            );
          }
        },
      ),
    );
  }
}
