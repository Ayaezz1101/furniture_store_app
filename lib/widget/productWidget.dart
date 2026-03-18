import 'package:flutter/material.dart';
import 'package:my_ecommerce/model/productData.dart';
import 'package:my_ecommerce/pages/productDetailsPage.dart';
import 'package:my_ecommerce/providors/chartProvidor.dart';
import 'package:my_ecommerce/widget/ratingWidget.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ProductWidget extends StatelessWidget {
  final String selectedCategory;

  const ProductWidget({super.key, required this.selectedCategory});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('products').where('type', isEqualTo: selectedCategory.toLowerCase()).snapshots(),
      builder: (context , snapshot) {
        if ( snapshot.connectionState == ConnectionState.waiting) {
          return const Center (child:CircularProgressIndicator() );
        }
        if(!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child : Text("no data"));
        }
      
    final docs = snapshot.data!.docs;
    
return GridView.builder(
  
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: docs.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.65, // تعديل بسيط ليعطي مساحة كافية للطول
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  ),
  
  itemBuilder: (context, index) {
    final selected = ProductData.fromMap(
  docs[index].data() as Map<String, dynamic>,
);
    
    return Container(
      // حذفت الارتفاع الثابت (320) لأن الـ GridView هو من يحدد الارتفاع
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الجزء العلوي: الصورة والتقييم
            Expanded( // استخدمنا Expanded لتاخذ الصورة أكبر مساحة متاحة
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Productdetailspage(product: selected),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 240, 240, 240),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity, // تأخذ كامل عرض المربع
                  child: Stack(
                    children: [
                      Center(
                        child: ClipRRect( // لمنع الصورة من الخروج عن الحواف
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(selected.image, fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        left: 4,
                        bottom: 4,
                        child: RatingWidget(rating: selected.examination),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 8),

            // الجزء السفلي: النصوص والأزرار
            Text(
              selected.name,
              maxLines: 1, // حماية: سطر واحد فقط
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),

            Text(
              selected.type,
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${selected.price}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: const Color(0xFF416954),
                    borderRadius: BorderRadius.circular(10), // خليته مربع ناعم ليشبه الكرت
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero, // ليتوسط الأيقونة
                    onPressed: () {
                      context.read<ChartProvidor>().addToChart(selected);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${selected.name} added!"), duration: const Duration(seconds: 1)),
                      );
                    },
                    icon: const Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      );
      },
    );
  },
);
}
}