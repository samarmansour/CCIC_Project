
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:taskes_project/category_API/categoru_model.dart';


class Categoryprovider with ChangeNotifier{
Categorymodel ? category;
 String? token;
  Future<dynamic>getAllData()async{
    var dio=Dio();
    dio.options.headers={
      "lang":"en",
      "Content-Type":"application/json",
      "Authorization":token,

    };
    
    
   final response= await dio.get("https://student.valuxapps.com/api/categories");
  
    category=Categorymodel.fromJson(response.data);
    notifyListeners();
  }
} 
