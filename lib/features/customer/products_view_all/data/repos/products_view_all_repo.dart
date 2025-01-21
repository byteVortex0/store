import '../../../../../core/services/graphql/api_result.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../admin/add_prodcuts/data/models/get_all_products_response.dart';
import '../data_source/products_view_all_data_source.dart';

class ProductsViewAllRepo {
  final ProductsViewAllDataSource dataSource;

  const ProductsViewAllRepo({required this.dataSource});

  //Get products view all
  Future<ApiResult<GetAllProductsResponse>> getProductsViewAll(
      {required int offset}) async {
    try {
      final response = await dataSource.getProductsViewAll(offset: offset);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
}
