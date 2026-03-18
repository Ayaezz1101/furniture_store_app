import 'package:flutter/material.dart';
class RatingWidget extends StatelessWidget {
  final int rating; 
  const RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$rating",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const Icon(Icons.star, color: Colors.amber, size: 18),
      ],
    );
  }
}