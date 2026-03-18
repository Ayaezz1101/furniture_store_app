import 'package:flutter/material.dart';
import 'package:my_ecommerce/model/productData.dart';
import 'package:my_ecommerce/providors/favouriteProvidor.dart';
import 'package:my_ecommerce/widget/quantityWidget.dart';
import 'package:my_ecommerce/widget/ratingWidget.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:my_ecommerce/providors/chartProvidor.dart';

class Productdetailspage extends StatefulWidget {
  final ProductData product;
  const Productdetailspage({super.key, required this.product});

  @override
  State<Productdetailspage> createState() => _Productdetailspage();
}

class _Productdetailspage extends State<Productdetailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // الزر السفلي مكانه الصحيح هنا كخاصية مباشرة للـ Scaffold
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF416954),
            minimumSize: const Size(double.infinity, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            context.read<ChartProvidor>().addToChart(widget.product);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Added to cart!")));
          },
          child: Text(
            "Add to card | \$${widget.product.price}",
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // قسم الصورة العلوي
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Image.network(
                        widget.product.image,
                        width: 250,
                        fit: BoxFit.contain,
                      ),
                    ),
                    // زر الرجوع
                    Positioned(
                      top: 20,
                      left: 20, // غيرته لليسار ليتناسب مع اتجاه السهم
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Container(
                          height: 50,
                            width: 50,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(300),
                          ),
                          child: const Icon(Icons.arrow_back_ios_new, size: 20),
                        ),
                      ),
                    ),
                    // زر المفضلة
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Selector<Favouriteprovidor, bool>(
                        selector: (context, favProvider) =>
                            favProvider.isProductFavorite(widget.product),
                        builder: (context, isFav, child) {
                          return Container(
                            height: 50,
                            width: 50,
                            decoration:  BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(300),
                            ),
                            child: IconButton(
                              onPressed: () {
                                context.read<Favouriteprovidor>().addToFav(
                                  widget.product,
                                );
                              },
                              icon: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: isFav ? Colors.red : Colors.black,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // قسم المعلومات
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RatingWidget(rating: widget.product.examination),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.product.type,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    ReadMoreText(
                      widget.product.description,
                      trimLines: 3,
                      colorClickableText: const Color(0xFF416954),
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Read more',
                      trimExpandedText: ' Read less',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                      moreStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF416954),
                      ),
                    ),
                    const SizedBox(height: 25),
                    // ويدجت الكمية
                    Quantitywidget(product: widget.product),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
