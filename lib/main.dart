import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isilir/src/controllers/auth_controller.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:isilir/src/features/router.dart';
import 'package:isilir/src/pages/home_page.dart';
import 'package:isilir/src/pages/login_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final List<CameraDescription> cameras = await availableCameras();
  final firstCamera = cameras.first;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: appPages,
    );
  }
}
