import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/services/base_api.dart';
import 'package:equatable/equatable.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  API api = API();
  late List<ProductModel> listProductModel;
  getProduct() async {
    try {
      var response = await api.dio.get('products');
      listProductModel = List<ProductModel>.from(
        response.data.map(
          (json) => ProductModel.fromJson(json),
        ),
      );
      emit(
        HomeLoaded(
          listProductModel: listProductModel,
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
