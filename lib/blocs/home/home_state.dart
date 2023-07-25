part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ProductModel> listProductModel;

  const HomeLoaded({
    required this.listProductModel,
  });
  @override
  List<Object> get props => [listProductModel];
}

class HomeLoading extends HomeState {}
