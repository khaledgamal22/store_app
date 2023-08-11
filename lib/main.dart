import 'package:flutter/material.dart';
import 'package:store/pages/addproduct_page.dart';
import 'package:store/pages/cubits/add_cubit/add_cubit.dart';
import 'package:store/pages/cubits/cart_cubit/cart_cubit.dart';
import 'package:store/pages/cubits/home_cubit/home_cubit.dart';
import 'package:store/pages/home_page.dart';
import 'package:store/pages/mycart_page.dart';
import 'package:store/pages/product_page.dart';
import 'package:store/pages/update_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp( const StoreApp());
  
}





class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>HomeCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => AddCubit(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            HomePage.id:(context)=>HomePage(),
            UpdatePage.id:(context)=>UpdatePage(),
            ProductPage.id:(context)=>ProductPage(),
            Addpage.id:(context)=>Addpage(),
            MyCartPage.id:(context)=>MyCartPage(),
          },
          initialRoute: HomePage.id,
        ),
    );
  }
}
