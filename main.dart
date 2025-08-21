import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_task/screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA_MXwr2iIhs-_BaRb4FFLVU5OD1yPfZ5A",
      appId: "1:982514454622:android:d1666152fcfe0db0d2a4cf",
      messagingSenderId: "982514454622",
      projectId: "internshiptask-326f7",
      storageBucket:
          "internshiptask-326f7.firebasestorage.app", // optional but recommended
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Internship Task',
          theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Roboto'),
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
