import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/loading/empty_screen.dart';
import 'package:store/core/loading/loading_shimmer.dart';
import 'package:store/features/admin/add_prodcuts/presentation/blocs/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:store/features/admin/add_prodcuts/presentation/widgets/create/create_products.dart';
import 'package:store/features/admin/add_prodcuts/presentation/widgets/products_admin_item.dart';

class AddProductsBody extends StatelessWidget {
  const AddProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CreateProducts(),
          SizedBox(height: 20.h),
          Expanded(
            child: RefreshIndicator.adaptive(
              onRefresh: () async {
                context.read<GetAllAdminProductsBloc>().add(
                    const GetAllAdminProductsEvent.getAllProducts(
                        isNotLoading: true));
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  SliverToBoxAdapter(
                    child: BlocBuilder<GetAllAdminProductsBloc,
                        GetAllAdminProductsState>(
                      builder: (BuildContext context,
                          GetAllAdminProductsState state) {
                        return state.when(
                          loading: () => GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: 10,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.w,
                              mainAxisSpacing: 15.h,
                              childAspectRatio: 165 / 250,
                            ),
                            itemBuilder: (context, index) => LoadingShimmer(
                              height: 220.h,
                              width: 165.w,
                            ),
                          ),
                          success: (productsList) => GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: productsList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.w,
                              mainAxisSpacing: 15.h,
                              childAspectRatio: 165 / 250,
                            ),
                            itemBuilder: (context, index) {
                              return ProductsAdminItem(
                                title: productsList[index].title!,
                                productId: productsList[index].id ?? '',
                                description:
                                    productsList[index].category!.name!,
                                imageUrl: productsList[index].images!.first,
                                price: productsList[index].price.toString(), 
                                imagesList: productsList[index].images!, 
                                categoryName: productsList[index].category!.name!, 
                                categoryId: productsList[index].category!.id!,
                              );
                            },
                          ),
                          empty: EmptyScreen.new,
                          error: Text.new,
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
