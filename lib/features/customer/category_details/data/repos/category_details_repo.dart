import 'package:store/features/admin/add_prodcuts/data/models/get_all_products_response.dart';

import '../../../../../core/services/graphql/api_result.dart';
import '../../../../../core/utils/app_strings.dart';
import '../data_source/category_details_data_source.dart';

class CategoryDetailsRepo {
  final CategoryDetailsDataSource dataSource;

  const CategoryDetailsRepo({required this.dataSource});

  Future<ApiResult<GetAllProductsResponse>> getCategoryDetails(
      {required int id}) async {
    try {
      final response = await dataSource.getCategoryDetails(id: id);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
}
