import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neonyx/features/auth/screen/claim_username.dart';
import 'package:neonyx/features/auth/screen/login.dart';
import 'package:neonyx/features/cloud/cloud.dart';
import 'package:neonyx/features/index/index.dart';
import 'package:neonyx/core/shared/hive_initializer.dart' as hive;

import 'core/get_it/configurator.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();

  // dependency injection entry point
  await configureDependencies();
  // initializing local storage
  hive.init();
  // set landscape orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black, // Color for Android
      statusBarBrightness:
          Brightness.dark // Dark == white status bar -- for IOS.
      ));

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      designSize: const Size(360, 800),
      builder: (context, child) =>
          const MaterialApp(debugShowCheckedModeBanner: false, home: ClaimUsername()),
    );
  }
}
