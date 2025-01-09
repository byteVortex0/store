import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/toast/show_toast.dart';
import '../../blocs/delete_product/delete_product_bloc.dart';
import '../../blocs/get_all_admin_products/get_all_admin_products_bloc.dart';

class DeleteProductsWidget extends StatelessWidget {
  const DeleteProductsWidget({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteProductBloc, DeleteProductState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.read<GetAllAdminProductsBloc>().add(
                  const GetAllAdminProductsEvent.getAllProducts(
                    isNotLoading: false,
                  ),
                );

            ShowToast.showToastSuccessTop(
              message: 'Your product has been deleted',
            );
          },
          error: (error) => ShowToast.showToastErrorTop(
            message: error,
          ),
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (id) {
            if (productId == id) {
              return SizedBox(
                height: 15.h,
                width: 15.h,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return const Icon(
              Icons.delete,
              color: Colors.red,
            );
          },
          orElse: () => IconButton(
            onPressed: () {
              context.read<DeleteProductBloc>().add(
                    DeleteProductEvent.deleteProduct(
                      id: productId,
                    ),
                  );
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
