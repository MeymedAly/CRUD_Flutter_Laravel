import 'package:apptest/appbinding.dart';
import 'package:apptest/views/addTach.dart';
import 'package:apptest/views/tacheview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Taches',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TacheView(),
      initialRoute: "/",
      initialBinding: AppBinding(),
      getPages: [
        GetPage(name: "/", page: () => TacheView()),
        GetPage(name: "/addtache", page: () => Tache()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
