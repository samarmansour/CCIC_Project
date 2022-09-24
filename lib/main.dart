import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:taskes_project/category_API/category_provider.dart';
import 'package:taskes_project/home_Api/home_provider.dart';
import 'package:taskes_project/login_Api/login.dart';
import 'package:taskes_project/login_Api/login_provider.dart';





void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create:(context)=>HomeProvider() ),
      ChangeNotifierProvider(create:(context)=>Categoryprovider() ),
      ChangeNotifierProvider(create:(context)=>Loginprovider() ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Login_Screen()
    ),
    );
  }
}
