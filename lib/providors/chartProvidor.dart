import 'package:flutter/material.dart';
import 'package:my_ecommerce/model/productData.dart';
import 'package:my_ecommerce/storage/local_storage_service.dart';

class ChartProvidor extends ChangeNotifier {
  List<ProductData> chartProduct = [];
  List<ProductData> historyProduct = [];

 void loadChartProduct() {
 chartProduct = Local_storage_Service.readStrigList('chartData');
    notifyListeners();

  }

  void addToChart(ProductData product) {
    if (!chartProduct.contains(product)) {
      chartProduct.add(product);
    } else {
      product.quantity++;
    }
    saveChartProduct ();
  }

  void removeFromChart(ProductData product) {
    if (product.quantity > 1) {
      product.quantity--;
    } else {
      chartProduct.remove(product);
    }
    saveChartProduct ();
  }


  void saveChartProduct (){
  Local_storage_Service.saveStringList('charData', chartProduct);
  notifyListeners();}



  int total_price (int price , int quantity){ 
    int total = 0;
    int i=0;
    if(chartProduct.isNotEmpty){
      for( i ; i<chartProduct.length ; i++ ) {
       total=total + chartProduct[i].price*chartProduct[i].quantity;
      }

    }
  return total;
  
  }
  void addToHistory(){
  if (chartProduct.isNotEmpty){
    historyProduct.addAll(chartProduct);
    saveChartProduct ();
    }
  }

  
  void clearChartList (){
    chartProduct.clear();
    saveChartProduct();
    notifyListeners();
  }

  bool isInChart(ProductData product) {
    return chartProduct.any((item) => item.id == product.id);
  }
}
