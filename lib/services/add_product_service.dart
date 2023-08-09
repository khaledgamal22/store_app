import 'package:store/helper/api_mpdel.dart';
import 'package:store/models/product_model.dart';

class AddProduct{

  Future<ProductModal> addproduct({required String title,required double price,required String image,required String categ,required String desc})async{

    Map<String,dynamic> data=await Api().post(
      url: 'https://fakestoreapi.com/products',
      body:{
        'title':title,
        'price':price,
        'image':image,
        'category':categ,
        'description':desc,
      }
    );

    ProductModal product =ProductModal.fromjson(data);
    return product;
  }
}