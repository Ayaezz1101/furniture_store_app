

import 'package:flutter/material.dart';
import 'package:my_ecommerce/model/productData.dart';

import 'package:my_ecommerce/storage/local_storage_service.dart';
class Favouriteprovidor extends ChangeNotifier {
  
  List<ProductData> favouriteProduct = []; 
  void saveData(){
    Local_storage_Service.saveStringList('fav item' , favouriteProduct); 
    notifyListeners();}
   

  void loadData(){
    favouriteProduct = Local_storage_Service.readStrigList('fav item');
    notifyListeners();
    }
  
  
  

  void addToFav(ProductData product) {
    bool exist = favouriteProduct.any((item) => item.id == product.id);

    if(exist ){
      favouriteProduct.removeWhere((item) => item.id == product.id);
    }
    else{
      favouriteProduct.add( product);
    }
    
    saveData();
    notifyListeners(); 
  }
  bool isProductFavorite(ProductData product) {
    return favouriteProduct.any((item) => item.id == product.id);
  }

  
}