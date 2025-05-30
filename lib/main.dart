import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/app/bloc_observer.dart';
import 'package:store/core/app/env_variables.dart';
import 'package:store/core/services/dynamic_links/dynamic_links.dart';
import 'package:store/core/services/hive/hive_database.dart';
import 'package:store/core/services/push_notification/firebase_cloud_messaging.dart';
import 'package:store/core/services/push_notification/local_notification.dart';
import 'package:store/core/services/shared_pref/shared_pref.dart';

import 'core/di/injection_container.dart';
import 'firebase_options.dart';
import 'store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EnvVariables.instance.init(envType: EnvTypeEnum.dev);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(() async {
    await FirebaseCloudMessaging().init();
    await LocalNotification.init();
  });

  await SharedPref().instantiatePreferences();

  await setupInjector();

  await HiveDatabase().setup();

  await DynamicLinks().initDynamicLinks();

  Bloc.observer = AppBlocObserver();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(const StoreApp()));
}
