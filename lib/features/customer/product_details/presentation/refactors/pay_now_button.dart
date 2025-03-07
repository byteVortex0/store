import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/common/widgets/custom_linear_button.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/services/paymob/paymob_service.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';

class PayNowButton extends StatefulWidget {
  const PayNowButton({super.key, required this.price});

  final double price;

  @override
  State<PayNowButton> createState() => _PayNowButtonState();
}

class _PayNowButtonState extends State<PayNowButton> {
  bool isLoading = false;
  String? paymentUrl;

  Future<void> handlePayment() async {
    setState(() => isLoading = true);

    log('🔵 بدء عملية الدفع...');

    try {
      final paymobService = PaymobService();

      // 1️⃣ الحصول على `authToken`
      String? authToken = await paymobService.getAuthToken();
      log('authToken: $authToken');
      if (authToken == null) {
        log('Failed to get auth token.');
        return;
      }

      // 2️⃣ إنشاء طلب جديد
      int? orderId = await paymobService.createOrder(
        authToken,
        widget.price * 100,
      ); // 100.00 EGP
      log('orderId: $orderId');
      if (orderId == null) {
        log('Failed to create order.');
        return;
      }

      // 3️⃣ الحصول على Payment Key
      String? paymentKey = await paymobService.getPaymentKey(
        authToken,
        orderId,
        widget.price * 100,
      );
      log('paymentKey: $paymentKey');
      if (paymentKey == null) {
        log('Failed to get payment key.');
        return;
      }

      // 4️⃣ توليد رابط الدفع
      setState(() {
        paymentUrl =
            'https://accept.paymob.com/api/acceptance/iframes/904091?payment_token=$paymentKey';
      });

      context.pushName(AppRoutes.paymentWebViewScreen, arg: paymentUrl);
    } catch (e) {
      log('❌ حدث خطأ: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('حدث خطأ أثناء الدفع')));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 500,
      child: Container(
        height: 90.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: context.color.containerShadow1,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextApp(
                text: '\$ ${widget.price} ',
                theme: context.textStyle.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeightHelper.medium,
                  color: context.color.bluePinkLight,
                ),
              ),

              isLoading
                  ? const CircularProgressIndicator()
                  : CustomLinearButton(
                    onPressed: handlePayment,
                    height: 40.h,
                    width: 140.w,
                    child: TextApp(
                      text: 'Pay Now',
                      theme: context.textStyle.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeightHelper.bold,
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
