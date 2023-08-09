import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product_model.dart';
import 'package:store/models/productprovider.dart';

import '../custom_componant/custom_card.dart';

class MyCartPage extends StatelessWidget {
  MyCartPage({super.key});

  static String id='cart_page';
  List<ProductModal> productlist=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('My Cart',style: TextStyle(color: Colors.blue),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: GridView.builder(
                  itemCount: productlist.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 0,
                  ),
                  itemBuilder: (context,index){
                    return CustomCard(product: productlist[index]);
                  },
                ),
      ),
    );
  }
}