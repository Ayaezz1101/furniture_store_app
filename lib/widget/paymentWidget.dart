import 'package:flutter/material.dart';
import 'package:my_ecommerce/widget/bankDetails.dart';

class Paymentwidget extends StatefulWidget {
  const Paymentwidget({super.key});
  @override
  State<Paymentwidget> createState() => _PaymentwidgetState();
}

class _PaymentwidgetState extends State<Paymentwidget> {
  String selectedType = "cash";

  Widget _buildPaymentOption(String title, String value, IconData icon) {
    bool isSelected = selectedType == value;
    return GestureDetector(
      onTap: () => setState(() => selectedType = value),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF416954).withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? const Color(0xFF416954) : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? const Color(0xFF416954) : Colors.grey),
            const SizedBox(width: 15),
            Text(title, style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? const Color(0xFF416954) : Colors.black,
            )),
            const Spacer(),
            if (isSelected) const Icon(Icons.check_circle, color: Color(0xFF416954)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Payment Method", 
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        _buildPaymentOption("Cash on Delivery", "cash", Icons.money_outlined),
        _buildPaymentOption("Credit Card", "bank", Icons.credit_card_outlined),
        
        if (selectedType == "bank") ...[
          const SizedBox(height: 10),
          Bankdetails(),
        ],
      ],
    );
  }
}