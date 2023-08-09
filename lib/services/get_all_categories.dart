

import '../helper/api_mpdel.dart';
class AllCategoriesService
{
  Future<List<dynamic>> getAllCatogories()async{
    List<dynamic> data= await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}