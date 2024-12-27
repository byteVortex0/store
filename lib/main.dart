import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/app/bloc_observer.dart';
import 'package:store/core/app/env_variables.dart';
import 'package:store/core/services/shared_pref/shared_pref.dart';

import 'core/di/injection_container.dart';
import 'firebase_options.dart';
import 'store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EnvVariables.instance.init(envType: EnvTypeEnum.dev);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SharedPref().instantiatePreferences();

  await setupInjector();

  Bloc.observer = AppBlocObserver();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(const StoreApp()));
}
