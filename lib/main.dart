import 'package:flutter/material.dart';
import 'package:tigabitsmt/data/apiservices/product_servie.dart';
import 'package:tigabitsmt/data/repository/database_helper.dart';
import 'package:tigabitsmt/presentation/cart/bloc/bloc/cart_bloc.dart';
import 'package:tigabitsmt/presentation/home/bloc/bloc/product_bloc.dart';
import 'package:tigabitsmt/presentation/home/pages/products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(productService: ProductService()),
        ),
        BlocProvider(create: (context) => CartBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProductListScreen(),
      ),
    );
  }
}
