import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shatiby/view/style/colors.dart';

import 'view/home.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyA6IhPG5WNJ1ppq_k_dMhKkAkFfRUiYFco",
        appId: "1:846696190832:web:d2c2069694b0f269c2f5b5",
        messagingSenderId: "846696190832",
        projectId: "khaled-3f721",
      databaseURL: "https://khaled-3f721-default-rtdb.asia-southeast1.firebasedatabase.app/"
    )
  );
  runApp( MyApp());
}

class MyApp extends StatefulWidget {


  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  _MyAppState();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.primaryBg
      ),
      home: HomePage(),
    );
  }
}
