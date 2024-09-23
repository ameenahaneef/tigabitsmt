import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tigabitsmt/data/apiservices/product_servie.dart';
import 'package:tigabitsmt/data/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService productService;
  ProductBloc({required this.productService}) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async{
      try {
        emit(ProductLoading());
        final products=await productService.fetchProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        print('Error fetching products: $e');
        emit(ProductError(e.toString()));
      }
    });
  }
}
