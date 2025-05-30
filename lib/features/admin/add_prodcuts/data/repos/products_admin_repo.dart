
import '../../../../../core/services/graphql/api_result.dart';
import '../../../../../core/utils/app_strings.dart';
import '../data_source/products_admin_data_source.dart';
import '../models/create_products_request_body.dart';
import '../models/get_all_products_response.dart';
import '../models/update_products_request_body.dart';

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
  
  //Create Categories
  Future<ApiResult<void>> createProducts({required CreateProductsRequestBody body}) async {
    try {
      final response = await dataSource.createProducts(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
  
  //Update Categories
  Future<ApiResult<void>> updateProducts({required UpdateProductsRequestBody body}) async {
    try {
      final response = await dataSource.updateProducts(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
  
  //Delete Categories
  Future<ApiResult<void>> deleteProducts({required String id}) async {
    try {
      final response = await dataSource.deleteProducts(id: id);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }

  
}
