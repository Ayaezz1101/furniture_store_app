import 'package:flutter/material.dart';

class Personalinfo extends StatelessWidget {
  const Personalinfo({super.key});

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: const Color(0xFF416954)),
      labelStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: Colors.grey[50],
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xFF416954), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Shipping Information", 
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        TextFormField(
          decoration: _buildInputDecoration("Full Name", Icons.person_outline),
          validator: (value) => (value == null || value.isEmpty) ? "Enter your name" : null,
        ),
        const SizedBox(height: 15),
        TextFormField(
          decoration: _buildInputDecoration("Phone Number", Icons.phone_android_outlined),
          keyboardType: TextInputType.phone,
          validator: (value) => (value == null || value.isEmpty) ? "Enter your number" : null,
        ),
        const SizedBox(height: 15),
        TextFormField(
          decoration: _buildInputDecoration("Address Details", Icons.location_on_outlined),
          validator: (value) => (value == null || value.isEmpty) ? "Enter your address" : null,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}