import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:store/models/product_model.dart';

import '../../../services/get_all_products.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super((HomeInitial()));
  List<ProductModal> products=[];

  void getProduct()async{
    emit(HomeLoading());
    try{
      products=await AllProductsService().getAllProducts();
      emit(HomeSuccess(productsList: products));
    }catch(e){
      emit(HomeFailre());
    }
  }
}
