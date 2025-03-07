import 'package:dio/dio.dart';
import 'package:store/core/app/env_variables.dart';

class PaymobService {
  final dio = Dio();

  Future<String?> getAuthToken() async {
    final response = await dio.post(
      'https://accept.paymob.com/api/auth/tokens',
      data: {'api_key': EnvVariables.instance.apiKey},
    );

    return response.data['token'];
  }

  Future<int?> createOrder(String authToken, double amountCents) async {
    final response = await dio.post(
      'https://accept.paymob.com/api/ecommerce/orders',
      data: {
        "auth_token": authToken,
        "delivery_needed": "false",
        "amount_cents": amountCents.toString(),
        "currency": "EGP",
        "items": [],
      },
    );

    return response.data['id']; // رقم الطلب Order ID
  }

  Future<String?> getPaymentKey(
    String authToken,
    int orderId,
    double amountCents, {
    String? name,
    String? email,
  }) async {
    final response = await dio.post(
      'https://accept.paymob.com/api/acceptance/payment_keys',
      data: {
        "auth_token": authToken,
        "amount_cents": amountCents.toString(),
        "expiration": 3600, // مدة صلاحية الدفع
        "order_id": orderId.toString(),
        "billing_data": {
          "first_name": name ?? "Amr",
          "last_name": "User",
          "email": email ?? "amr@example.com",
          "phone_number": "01000000000",
          "apartment": "N/A",
          "floor": "N/A",
          "street": "N/A",
          "building": "N/A",
          "city": "Cairo",
          "state": "Cairo",
          "country": "EG",
          "postal_code": "12345",
        },
        "currency": "EGP",
        "integration_id": 5002737, // ضع رقم التكامل الخاص بك هنا
      },
    );

    return response.data['token'];
  }
}
