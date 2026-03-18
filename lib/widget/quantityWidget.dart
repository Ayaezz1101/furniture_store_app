import 'package:flutter/material.dart';
import 'package:my_ecommerce/model/productData.dart';
import 'package:my_ecommerce/providors/chartProvidor.dart';
import 'package:provider/provider.dart';

class Quantitywidget extends StatefulWidget {
  final  ProductData product;
  const Quantitywidget( {super.key, required this.product});

  @override
  State<Quantitywidget> createState() => _QuantityWidget();
}

class _QuantityWidget extends State<Quantitywidget> {
  @override
  // داخل ملف quantityWidget.dart
Widget build(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: Colors.grey[100], // لون فاتح بدل الرمادي الغامق
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min, // ليأخذ حجم محتواه فقط
      children: [
        IconButton(
          onPressed: () => context.read<ChartProvidor>().removeFromChart(widget.product),
          icon: const Icon(Icons.remove, size: 20, color: Colors.black),
        ),
        Consumer<ChartProvidor>(
          builder: (context, prov, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "${widget.product.quantity}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
        IconButton(
          onPressed: () => context.read<ChartProvidor>().addToChart(widget.product),
          icon: const Icon(Icons.add, size: 20, color: Color(0xFF416954)),
        ),
      ],
    ),
  );
}}
