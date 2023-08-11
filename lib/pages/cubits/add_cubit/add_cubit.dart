import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../services/add_product_service.dart';


part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddInitial());

  void addnewproduct({
    required String title,
    required dynamic price,
    required String image,
    required String category,
    required String description,
  }) async {
    emit(AddLoading());
    try{
      await AddProduct().addproduct(
      title: title,
      price: price,
      image: image,
      categ: category,
      desc : description,
      );
    }catch(e){
      emit(AddFailre());
    }
  }

}
