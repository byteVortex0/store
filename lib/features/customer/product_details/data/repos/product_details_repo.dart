// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:store/core/services/graphql/api_result.dart';
import 'package:store/features/customer/product_details/data/data_source/product_details_data_source.dart';
import 'package:store/features/customer/product_details/data/models/product_details_response.dart';

import '../../../../../core/utils/app_strings.dart';

class ProductDetailsRepo {
  ProductDetailsDataSource dataSource;
  ProductDetailsRepo({
    required this.dataSource,
  });

  Future<ApiResult<ProductDetailsResponse>> getOneProduct(
      {required int id}) async {
    try {
      final response = await dataSource.getOneProduct(id: id);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
}
