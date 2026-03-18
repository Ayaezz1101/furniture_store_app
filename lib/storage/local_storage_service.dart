import 'dart:convert';



import 'package:my_ecommerce/model/productData.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Local_storage_Service {

  static late SharedPreferences prefs ;

  static Future<void> init() async {

    prefs =await SharedPreferences.getInstance();

  }

  static void saveStringList(String key , List<ProductData> list)  {
    List<String> data = list.map((item) => jsonEncode(item.toMap())).toList();

     prefs.setStringList(key, data);

  }

  static List<ProductData> readStrigList(String key){

    List<String> data =  prefs.getStringList(key) ?? [];
    return data.map((item) => ProductData.fromMap(jsonDecode(item))).toList();
    
  }



}