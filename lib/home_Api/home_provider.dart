import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:taskes_project/home_Api/product_model.dart';


class HomeProvider with ChangeNotifier{
  categorymodel? data;
  String? token;
  Future<dynamic>getAllData()async{
    var dio=Dio();
    dio.options.headers={
      "lang":"en",
      "Content-Type":"application/json",
      "Authorization":token,

    };
    
    
   final response= await dio.get("https://student.valuxapps.com/api/home");
  
    data=categorymodel.fromJson(response.data);
    notifyListeners();
  }
}









