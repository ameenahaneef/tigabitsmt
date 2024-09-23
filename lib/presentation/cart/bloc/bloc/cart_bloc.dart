import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tigabitsmt/data/models/product_model.dart';
import 'package:tigabitsmt/data/repository/database_helper.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<LoadCartEvent>((event, emit) async {
      emit(CartLoading());
      try {
        List<Product> products = await DatabaseHelper.getProducts(); 
        print(products);
        emit(CartLoaded(products));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });
  }
}
