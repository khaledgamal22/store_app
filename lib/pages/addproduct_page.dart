import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/custom_componant/custom_button.dart';
import 'package:store/custom_componant/custom_textfeild.dart';
import 'package:store/pages/cubits/add_cubit/add_cubit.dart';
import 'package:store/pages/cubits/home_cubit/home_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Addpage extends StatelessWidget {
  static const id = 'add_page';
  String? title;

  dynamic price;

  String? description;

  String? image;

  String? category;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: BlocListener<AddCubit, AddState>(
        listener: (context, state) {
          if(state is AddLoading){
            isLoading=true;
          }
          else{
            isLoading=false;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              'Add Product',
              style: TextStyle(color: Colors.blue),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextFormField(
                      hinttext: 'Product name',
                      onchange: (data) {
                        title = data;
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      hinttext: 'description',
                      onchange: (data) {
                        description = data;
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      inputType: TextInputType.number,
                      hinttext: 'price',
                      onchange: (data) {
                        price = double.parse(data);
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      hinttext: 'image',
                      onchange: (data) {
                        image = data;
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      hinttext: 'category',
                      onchange: (data) {
                        category = data;
                      }),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    text: 'ADD',
                    onpressed: () async {
                      BlocProvider.of<AddCubit>(context).addnewproduct(
                        title: title!,
                        price: price,
                        image: image!,
                        category: category!,
                        description: description!,
                        );
                        BlocProvider.of<HomeCubit>(context).getProduct();
                        Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
