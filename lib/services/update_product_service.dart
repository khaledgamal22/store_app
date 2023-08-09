
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store/helper/api_mpdel.dart';
import 'package:store/models/product_model.dart';

class UpdateProduct{

  Future<ProductModal> update({required int id,required String title,required double price,required String categ,required String image,required String desc})async{

    Map<String,dynamic> data= await Api().put(
        url: 'https://fakestoreapi.com/products/$id',
        body: {
          "title": title,
          "price": price,
          "description": desc,
          "image": image,
          "category":categ,
        },
    );
    return ProductModal.fromjson(data);
  }
}