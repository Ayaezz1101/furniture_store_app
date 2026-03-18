import 'package:flutter/material.dart';

import 'package:my_ecommerce/widget/bottomNAvigatorBArWidget.dart';
//import 'home.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 24;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                "images/unsplash_FkKClUPUURU.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Enjoy Your Online Shopping",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "Browse through all categories and shop the best furniture for your dream house",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF416954), 
                          foregroundColor: Colors.white,),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BottomNavigationBarWidget(),
                      ),
                    );
                  },
                  child: const Text("Get Started"),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
