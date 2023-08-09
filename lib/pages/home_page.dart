import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/pages/addproduct_page.dart';
import 'package:store/pages/cubits/home_cubit/home_cubit.dart';
import 'package:store/pages/mycart_page.dart';
import '../custom_componant/custom_card.dart';


class HomePage extends StatefulWidget {
  static String id = 'homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'New Trend',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, MyCartPage.id);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.blue,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state){
              return state is HomeSuccess? GridView.builder(
              itemCount: state.productsList.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 50,
                crossAxisSpacing: 0,
              ),
              itemBuilder: (context, index) {
                return CustomCard(product: state.productsList[index]);
              },
            ): const Center(child: CircularProgressIndicator(),);
            },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Addpage.id);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
