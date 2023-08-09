import 'rating_model.dart';

class ProductModal{
  final dynamic id;
  String title;
  dynamic price;
  String discreption;
  String image;
  String category;
  RatingModel rating;
  ProductModal({
    required this.id,
    required this.title,
    required this.price,
    required this.discreption,
    required this.image,
    required this.category,
    required this.rating
  });

  factory ProductModal.fromjson(jsonData){
    return ProductModal(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        discreption: jsonData['description'],
        image: jsonData['image'],
        category: jsonData['category'],
        rating: RatingModel.fromjson(jsonData['rating']),
    );
  }

}