
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/custom_componant/custom_button.dart';
import 'package:store/models/product_model.dart';
import 'package:store/models/productprovider.dart';
import 'package:store/pages/update_page.dart';

class ProductPage extends StatelessWidget {

  static String id='product_page';
  
  ProductPage({super.key});



  @override
  Widget build(BuildContext context) {

    ProductModal product=ModalRoute.of(context)!.settings.arguments as ProductModal;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              product.image,
              height: 300,
              width: 300,
              ),
            SizedBox(height: 20,),
            Text(product.title),
            SizedBox(height: 20,),
            Text('description : '),
            SizedBox(height: 5,),
            Container(
              child: Text(product.discreption,
              style: TextStyle(
                color: Colors.black
                ),
              ),
            ),
            SizedBox(height: 50,),
            Text('Category : ${product.category}'),
            SizedBox(height: 10,),
            Text('Price :  ${product.price}'),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(text: 'Add to card', onpressed: (){
                  Provider.of<ProductProvider>(context,listen: false).productlist.add(product);
                },
                ),
                SizedBox(width: 10,),
                CustomButton(text: 'Update', onpressed: (){
                  Navigator.pushNamed(context, UpdatePage.id,arguments: product);
                },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}