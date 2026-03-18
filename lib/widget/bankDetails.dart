import 'package:flutter/material.dart';

class Bankdetails extends StatelessWidget {
  Bankdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Bank Name",
              icon: Icon(Icons.account_balance, color: Color(0xFF416954)),
            ),
            validator: (value) => (value == null || value.isEmpty) ? "Required" : null,
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Card Number",
              icon: Icon(Icons.numbers, color: Color(0xFF416954)),
            ),
            keyboardType: TextInputType.number,
            validator: (value) => (value == null || value.isEmpty) ? "Required" : null,
          ),
        ],
      ),
    );
  }
}