import '../../../../../core/services/graphql/api_result.dart';
import '../../../../../core/utils/app_strings.dart';
import '../data_source/products_admin_data_source.dart';
import '../models/get_all_products_response.dart';

class ProductsAdminRepo {
  final ProductsAdminDataSource dataSource;

  const ProductsAdminRepo({required this.dataSource});

  //Get All Categories
  Future<ApiResult<GetAllProductsResponse>> getAllProducts() async {
    try {
      final response = await dataSource.getAllProducts();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
}
