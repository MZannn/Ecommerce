part of 'detail_cubit.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class AddToCart extends DetailState {
  final List<ProductModel> listProduct;
  const AddToCart({required this.listProduct});
  @override
  List<Object> get props => [listProduct];
}
