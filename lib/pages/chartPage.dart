import 'package:flutter/material.dart';

import 'package:my_ecommerce/providors/chartProvidor.dart';
import 'package:my_ecommerce/widget/checkoutWidget.dart';
import 'package:my_ecommerce/widget/quantityWidget.dart';
import 'package:provider/provider.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPage();
}

class _ChartPage extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ChartProvidor>(
        builder: (context, chartProv, child) {
          final chartList = chartProv.chartProduct;

          return ListView.builder(
            itemCount: chartList.length,
            itemBuilder: (context, index) {
              final product = chartList[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                elevation: 0,
                color: Colors.grey[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: Image.network(product.image, width: 60),
                  title: Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "\$${product.price}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: Quantitywidget(product: product),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xFF416954),
          boxShadow: [BoxShadow(color: Colors.white, blurRadius: 5)],
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(body: Checkoutwidget()),
              ),
            );
          },
          child: Text("Checkout"),
        ),
      ),
    );
  }
}
