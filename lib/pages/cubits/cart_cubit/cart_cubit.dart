import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<ProductModal> cartList=[];
  void AddProductToCart(ProductModal product){
    cartList.add(product);
    emit(CartSuccess());
  }
}
