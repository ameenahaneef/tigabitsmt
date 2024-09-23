part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class LoadCartEvent extends CartEvent {}