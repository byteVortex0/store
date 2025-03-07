import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../core/common/widgets/customer_app_bar.dart';

class PaymentWebViewScreen extends StatefulWidget {
  final String paymentUrl;

  const PaymentWebViewScreen({super.key, required this.paymentUrl});

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.contains("success")) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('✅ الدفع تم بنجاح!')),
                  );
                  Navigator.pop(context);
                } else if (request.url.contains("failure")) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('❌ فشل الدفع!')));
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Complete Payment'),
      body: WebViewWidget(controller: _controller),
    );
  }
}
