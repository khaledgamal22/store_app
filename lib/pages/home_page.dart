import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/pages/addproduct_page.dart';
import 'package:store/pages/cubits/home_cubit/home_cubit.dart';
import 'package:store/pages/mycart_page.dart';
import '../custom_componant/custom_card.dart';
import '../models/product_model.dart';


class HomePage extends StatelessWidget {
  static String id = 'homePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'New Trend',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, MyCartPage.id);
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.blue,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context,state){},
          builder: (context, state){
            BlocProvider.of<HomeCubit>(context).getProduct();
            if(state is HomeSuccess){
              List<ProductModal> productlist=[];
              productlist=state.productsList;
              return GridView.builder(
              itemCount: productlist.length,
              clipBehavior: Clip.none,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 50,
                crossAxisSpacing: 0,
              ),
              itemBuilder: (context, index) {
                return CustomCard(product: productlist[index]);
              },
            );
            }
            else if(state is HomeFailre){
              return Center(
                child: Text('there was an error,please try again',style: TextStyle(fontSize: 30),),
              );
            }
            else if(state is HomeLoading){
              return Center(child: CircularProgressIndicator(),);
            }
            else{
              return Center(child: Text('LOADING.....'),);
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Addpage.id);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
