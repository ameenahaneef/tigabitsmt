part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Product> products;

  CartLoaded(this.products);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}
