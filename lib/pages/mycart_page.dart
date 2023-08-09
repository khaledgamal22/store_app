import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/models/product_model.dart';
import '../custom_componant/custom_card.dart';
import 'cubits/cart_cubit/cart_cubit.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  static String id = 'cart_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          List<ProductModal> cartlist=BlocProvider.of<CartCubit>(context).cartList;
          return Padding(
            padding: const EdgeInsets.only(top: 50),
            child: GridView.builder(
              itemCount: cartlist.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 50,
                crossAxisSpacing: 0,
              ),
              itemBuilder: (context, index) {
                return CustomCard(product: cartlist[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
