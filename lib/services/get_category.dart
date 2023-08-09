
import 'package:store/helper/api_mpdel.dart';
import 'package:store/models/product_model.dart';
class CategoryService{
  Future<List<ProductModal>> getCategory({required String categoryName})async{
    List<dynamic> data=await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModal> productslist=[];
    for(int i=0;i<data.length;i++){
      productslist.add(ProductModal.fromjson(data[i]));
    }
    return productslist;
  }
}