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
                color: Colors.grey[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // صورة المنتج
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.network(
                          product.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // الاسم والسعر
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "\$${product.price}",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      // Quantity Widget
                      Quantitywidget(product: product),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        height: 100,
        decoration: const BoxDecoration(
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
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF416954),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Checkout",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}