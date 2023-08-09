
import 'package:store/helper/api_mpdel.dart';

import '../models/product_model.dart';

class AllProductsService
{
 Future<List<ProductModal>> getAllProducts ()async
 {
   List<dynamic> data= await Api().get(url: 'https://fakestoreapi.com/products');

   List<ProductModal> productslist=[];
   for(int i=0;i<data.length;i++){
    productslist.add(ProductModal.fromjson(data[i]));
   }
   return productslist;
 }
}