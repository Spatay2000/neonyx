import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neonyx/features/auth/screen/login.dart';
import 'package:neonyx/features/index/index.dart';
import 'package:neonyx/core/shared/hive_initializer.dart' as hive;
import 'package:shared_preferences/shared_preferences.dart';

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
      builder: (context, child) => const MaterialApp(
          debugShowCheckedModeBanner: false, home: SessionManager()),
    );
  }
}

class SessionManager extends StatefulWidget {
   const SessionManager({super.key});

   @override
   _SessionManagerState createState() => _SessionManagerState();
 }

 class _SessionManagerState extends State<SessionManager> {
   bool isLoggedIn = false;

   @override
   void initState() {
     super.initState();
     checkLoginStatus();
   }

   Future<void> checkLoginStatus() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     bool loggedIn = prefs.getBool('logged') ?? false;
     setState(() {
       isLoggedIn = loggedIn;
     });
   }

   @override
   Widget build(BuildContext context) {
     if (isLoggedIn) {
       return const IndexNeo(screenIndex: 0,); // Если пользователь вошел, показываем главный экран.
     } else {
       return const LoginScreen(); // Если пользователь не вошел, показываем экран входа.
     }
   }
 }
