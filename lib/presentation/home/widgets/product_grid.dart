import 'package:flutter/material.dart';
import 'package:tigabitsmt/core/colors/colors.dart';
import 'package:tigabitsmt/data/models/product_model.dart';
import 'package:tigabitsmt/data/repository/database_helper.dart';

Widget buildProductGrid(List<Product> products) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.75,
    ),
    itemCount: products.length,
    itemBuilder: (context, index) {
      final product = products[index];
      return Card(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: product.resourceMediumPath != null &&
                      product.resourceMediumPath!.isNotEmpty
                  ? Image.network(
                      product.cdnUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Icon(Icons.error, size: 50));
                      },
                    )
                  : const Center(child: Icon(Icons.shopping_cart, size: 50)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.productName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Price: \$${product.productPrice}'),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await DatabaseHelper.initializeDatabase();

                    await DatabaseHelper.addProduct(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('${product.productName} added to cart!')),
                    );
                  } catch (e) {
                    print(e.toString());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $e')),
                    );
                  }
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: bgrey),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
