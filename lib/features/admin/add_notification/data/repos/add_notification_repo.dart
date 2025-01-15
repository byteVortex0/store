// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:store/core/services/graphql/api_result.dart';
import 'package:store/core/utils/app_strings.dart';
import 'package:store/features/admin/add_notification/data/data_source/add_notification_data_source.dart';

class AddNotificationRepo {
  AddNotificationDataSource dataSource;

  AddNotificationRepo({
    required this.dataSource,
  });

  Future<ApiResult<void>> sendNotification({
    required String title,
    required String body,
    required int productId,
  }) async {
    try {
      final response = await dataSource.sendNotification(
        title: title,
        body: body,
        productId: productId,
      );
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
}
