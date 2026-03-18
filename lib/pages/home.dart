import 'package:flutter/material.dart';

import 'ProfilePage.dart';
//import 'package:my_ecommerce/model/productData.dart';
import 'package:my_ecommerce/widget/productWidget.dart';
import 'package:my_ecommerce/widget/bestSallerWidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  int selectedcategoriesIndex = 0;
  final List<String> Categories = ["Chairs", "Tables", "Cupboards", "Lamps", "Beds"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 200, // لجعل النص على سطرين
                      child: Text(
                        "Discover The Best Furniture.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          height: 1.2,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: IconButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfilePage(),
                          ),
                        ),
                        icon: const Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search for furniture",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(
                      Icons.tune,
                    ), // أيقونة الفلتر من فيغما
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "categories",
                style: TextStyle(
                  color: Color(0xFF416954),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Categories.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedcategoriesIndex = index;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                        right: 8,
                      ), // مسافة بين كل تاب والثاني
                      padding: const EdgeInsets.symmetric(horizontal: 25),

                      decoration: BoxDecoration(
                        color: index == selectedcategoriesIndex
                            ? const Color(0xFF416954)
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        Categories[index],
                        style: TextStyle(
                          color: index == selectedcategoriesIndex
                              ? Colors.grey
                              : Color(0xFF416954),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Builder(
                builder: (context) {
                  return ProductWidget(
                    selectedCategory: Categories[selectedcategoriesIndex],
                  );
                },
              ),
              SizedBox(height: 10),
              Text(
                "Best saller",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Builder(
                builder: (context) {
                  return BestSalllerWidget(
                    selectedCategory: Categories[selectedcategoriesIndex],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
