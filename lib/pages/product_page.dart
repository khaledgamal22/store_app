
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/custom_componant/custom_button.dart';
import 'package:store/models/product_model.dart';
import 'package:store/pages/update_page.dart';
import 'cubits/cart_cubit/cart_cubit.dart';

class ProductPage extends StatelessWidget {

  static String id='product_page';
  
  const ProductPage({super.key});



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
            const SizedBox(height: 20,),
            Text(product.title),
            const SizedBox(height: 20,),
            const Text('description : '),
            const SizedBox(height: 5,),
            Container(
              child: Text(product.discreption,
              style: const TextStyle(
                color: Colors.black
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Text('Category : ${product.category}'),
            const SizedBox(height: 10,),
            Text('Price :  ${product.price}'),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(text: 'Add to card', onpressed: (){
                  BlocProvider.of<CartCubit>(context).AddProductToCart(product);
                },
                ),
                const SizedBox(width: 10,),
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