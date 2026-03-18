import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:my_ecommerce/providors/favouriteProvidor.dart';



class Favouritepage extends StatefulWidget {
  
  const Favouritepage({super.key});

 
  @override
  State<Favouritepage> createState() => _FavouritePage();
}

class _FavouritePage extends State<Favouritepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Favorites")),
      body: Consumer<Favouriteprovidor>(
        builder: (context, favProvider, child) {
          final list = favProvider.favouriteProduct;

          if (list.isEmpty) {
            return const Center(child: Text("Your wishlist is empty!"));
          }

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final product = list[index];
              return ListTile(
                leading: Image.network(product.image),
                title: Text(product.name),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    context.read<Favouriteprovidor>().addToFav(product);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}