import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/customer/product_details/presentation/blocs/product_details/product_details_bloc.dart';
import 'package:store/features/customer/product_details/presentation/refactors/product_details_body.dart';

import '../../../../../core/common/widgets/customer_app_bar.dart';
import '../../../../../core/di/injection_container.dart';
import '../refactors/add_to_cart_button.dart';
import '../refactors/product_details_custom_painter.dart';

class ProductDetialsScreen extends StatelessWidget {
  const ProductDetialsScreen({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductDetailsBloc>()
        ..add(ProductDetailsEvent.getOneProduct(id: productId)),
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          return state.when(
            loading: () => Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: context.color.textColor,
              ),
            ),
            success: (data) => Scaffold(
              appBar: CustomAppBar(title: shortenText(data.title!)),
              body: Stack(
                children: [
                  CustomPaint(
                    size: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height,
                    ),
                    painter: DetailsCustomPainter(
                      gradient: LinearGradient(
                        colors: [
                          context.color.bluePinkLight!,
                          context.color.bluePinkDark!,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  ProductDetialsBody(data: data),
                ],
              ),
              bottomNavigationBar: AddToCartButton(
                price: data.price!,
              ),
            ),
            error: Text.new,
          );
        },
      ),
    );
  }

  String shortenText(String text) {
    if (text.length > 18) {
      return '${text.substring(0, 18)}...';
    }
    return text;
  }
}
