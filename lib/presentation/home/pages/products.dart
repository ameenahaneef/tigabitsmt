import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigabitsmt/presentation/cart/pages/cart.dart';
import 'package:tigabitsmt/presentation/home/bloc/bloc/product_bloc.dart';
import 'package:tigabitsmt/presentation/home/widgets/product_grid.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductBloc>(context).add(FetchProducts());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const CartScreen();
                }));
              },
              icon: const Icon(Icons.shop_two_outlined))
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductLoaded) {
            return buildProductGrid(state.products);
          } else if (state is ProductError) {
            return Center(
              child: Text('Failed to load products: ${state.message}'),
            );
          }
          return const Center(child: Text('No products available.'));
        },
      ),
    );
  }

 
}
