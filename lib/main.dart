import 'package:flutter/material.dart';
import 'package:store/pages/addproduct_page.dart';
import 'package:store/pages/cubits/home_cubit/home_cubit.dart';
import 'package:store/pages/home_page.dart';
import 'package:store/pages/mycart_page.dart';
import 'package:store/pages/product_page.dart';
import 'package:store/pages/update_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(const StoreApp());
}



class StoreApp extends StatefulWidget {
  const StoreApp({super.key});

  @override
  State<StoreApp> createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
  @override
  void initState() async{
    await BlocProvider.of<HomeCubit>(context).getProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>HomeCubit(),
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
