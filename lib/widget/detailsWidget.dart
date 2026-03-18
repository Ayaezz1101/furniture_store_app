import 'package:flutter/material.dart';
import 'package:my_ecommerce/providors/chartProvidor.dart';
import 'package:provider/provider.dart';
class Detailswidget extends StatelessWidget {
  const Detailswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChartProvidor>(builder: (context, chartProvidor1 , child){
      final list = chartProvidor1 .chartProduct; 
      return ListView.builder(
                  shrinkWrap: true, 
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text("${item.quantity} * ${item.price}"),
                      trailing: Text("total${item.quantity * item.price}"),
                    );
                  },
                );
    }
    );
  
  }
}