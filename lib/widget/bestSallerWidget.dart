import 'package:flutter/material.dart';
import 'package:my_ecommerce/model/productData.dart';
import 'package:my_ecommerce/pages/productDetailsPage.dart';
import 'package:my_ecommerce/providors/chartProvidor.dart';
import 'package:my_ecommerce/widget/ratingWidget.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BestSalllerWidget extends StatelessWidget {
  final String selectedCategory;

  const BestSalllerWidget({super.key, required this.selectedCategory});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance
      .collection('products')
      .where('type', isEqualTo: selectedCategory.toLowerCase())
      .where('salle', isEqualTo: 'yes') 
      .snapshots(),
      builder: (context , snapshot) {
        if ( snapshot.connectionState == ConnectionState.waiting) {
          return const Center (child:CircularProgressIndicator() );
        }
        if(!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child : Text("no data"));
        }
      
    final docs = snapshot.data!.docs;
    
    return SizedBox(
      height: 120,
      child: ListView.builder(
        
        scrollDirection: Axis.horizontal,
        itemCount: docs.length,
       
        itemBuilder: (context, index) {
          
          final product = ProductData.fromMap(
        docs[index].data() as Map<String, dynamic>,
      );
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                     Productdetailspage(product: product)
                ),
              );
            },
            child:  Stack(
              children: [Container( 
                margin: EdgeInsets.only(left: 3 , right: 3),
                  height: 110,
                  width: MediaQuery.of(context).size.width*0.8 ,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        height: double.infinity ,
                        width: 100 , 
                        color: Colors.grey,
                        child: Stack(
                          children: [
                            SizedBox(
                        width: 100,
                        height: double.infinity,
                        child: Image.network(product.image, fit: BoxFit.cover),
                        
                      ),
                            Positioned(
                              left: 2,
                              bottom: 1,
                              child:
                                      RatingWidget(rating:product.examination) ,
                                   
                              
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Column(
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                product.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            FittedBox( fit: BoxFit.scaleDown,
                              child: Text(
                                product.type,
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ),
                            SizedBox(height: 4),
                            FittedBox( fit: BoxFit.scaleDown, 
                              child: Text(
                                "${product.price}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                         
                      
                    ],
                  ),
                ),
                Positioned(right: 3, bottom: 3,
                           child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFF416954),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              onPressed: () {
                                context.read<ChartProvidor>().addToChart(
                                  product,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "${product.name} added to cart!",
                                    ),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                              icon: Icon(Icons.add),
                              color: Colors.white,
                              iconSize: 25,
                            ),
                                                   ),
                         ),
              ],
              
            ),
              
          );
        },
      ),
        );
  },
);
}
}