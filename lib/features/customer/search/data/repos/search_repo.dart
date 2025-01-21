import '../../../../../core/services/graphql/api_result.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../admin/add_prodcuts/data/models/get_all_products_response.dart';
import '../data_source/search_data_source.dart';
import '../models/search_request_body.dart';

class SearchRepo {
  final SearchDataSource dataSource;

  const SearchRepo({required this.dataSource});

  //Search for products
  Future<ApiResult<GetAllProductsResponse>> searchForProductsByTitle(
      {required String title}) async {
    try {
      final response = await dataSource.searchForProductsbyTitle(title: title);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }

  Future<ApiResult<GetAllProductsResponse>> searchForProductsByPrice(
      {required SearchRequestBody body}) async {
    try {
      final response = await dataSource.searchForProductsbyPrice(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
}
