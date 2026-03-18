import 'package:flutter/material.dart';
import 'package:my_ecommerce/pages/sucsessPage.dart';
import 'package:my_ecommerce/providors/chartProvidor.dart';
import 'package:my_ecommerce/widget/detailsWidget.dart';
import 'package:my_ecommerce/widget/personalInfo.dart';
import 'package:provider/provider.dart';
import './paymentWidget.dart';

class Checkoutwidget extends StatelessWidget {
  Checkoutwidget({super.key});
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
  
    return SingleChildScrollView(padding: EdgeInsets.all(15),child: Form(
        key: _key,
          child: Column(
              children: [
                Builder(
                  builder: (context) {
                    return Detailswidget();
                  }
                ),
                
                const Divider(),
                Builder(
                  builder: (context) {
                    return Personalinfo();
                  }
                ) ,
                
                
                Builder(
                  builder: (context) {
                    return Paymentwidget();
                  }
                ) ,
                SizedBox(height: 10,) ,
               SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF416954),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      context.read<ChartProvidor>().addToHistory();
                      context.read<ChartProvidor>().clearChartList();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Sucsesspage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please complete the information")),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Confirm Order",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 15),
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ),
          ],),
       
          
        ),
        
      

    );
      } 
    
    
  }
  
