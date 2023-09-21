import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:po_app/responsive_layout.dart';
import 'package:po_app/small_android_device/small_home_page.dart';
import 'package:po_app/small_android_device/small_login.dart';
import 'package:po_app/tab_android_device/tab_home_page.dart';
import 'package:po_app/tab_android_device/tab_login.dart';

import 'constants/color_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColor.mainColor,
      ),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Something Went Wrong"),
              );
            } else if (snapshot.hasData) {
              return const ResponsiveLayout(
                mobileScreen: SmallHomePage(),
                tabletScreen: TabHomePage(),
              );
            } else {
              return const ResponsiveLayout(
                mobileScreen: SmallLoginPage(),
                tabletScreen: TabLoginPage(),
              );
            }
          }),
    );
  }
}
