import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:store/core/di/injection_container.dart';
import 'package:store/core/routes/app_routes.dart';

class DynamicLinks {
  // static const String dynamicLink = 'https://store.page.link/';

  DynamicLinks._();

  factory DynamicLinks() => _instance;

  static final DynamicLinks _instance = DynamicLinks._();

  Future<String> generateDynamicLink({
    required String productId,
    required String title,
    required String image,
  }) async {
    final dynamicLinkParms = DynamicLinkParameters(
      uriPrefix: 'https://asroostore.page.link',
      link: Uri.parse('https://www.udemy.com/$productId'),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: title,
        description: 'big store',
        imageUrl: Uri.parse(image),
      ),
      androidParameters: const AndroidParameters(
        packageName: 'com.dev_mahmoud.store',
        minimumVersion: 1,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.dev_mahmoud.store',
        minimumVersion: '1.0.0',
      ),
    );

    final dynamicLink = await FirebaseDynamicLinksPlatform.instance
        .buildShortLink(dynamicLinkParms);

    log(dynamicLink.shortUrl.toString());

    return dynamicLink.shortUrl.toString();
  }

  Future<void> initDynamicLinks() async {
    final initialLink =
        await FirebaseDynamicLinksPlatform.instance.getInitialLink();
    if (initialLink != null) {
      Future.delayed(const Duration(seconds: 1), () {
        handleDynamicLinks(initialLink.link.path);
      }).onError(
        (error, stackTrace) {
          log(error.toString());
        },
      );
    }

    FirebaseDynamicLinks.instance.onLink.listen(
      (event) {
        final path = event.link.path;

        Future.delayed(const Duration(seconds: 1), () {
          handleDynamicLinks(path);
        }).onError(
          (error, stackTrace) {
            log(error.toString());
          },
        );
      },
    );
  }

  void handleDynamicLinks(String link) {
    final splitLink = link.split('/');

    sl<GlobalKey<NavigatorState>>().currentState!.pushNamed(
        AppRoutes.productDetails,
        arguments: int.parse(splitLink[1]));
  }
}
