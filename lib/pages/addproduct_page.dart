import 'package:flutter/material.dart';
import 'package:store/custom_componant/custom_button.dart';
import 'package:store/custom_componant/custom_textfeild.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/add_product_service.dart';
import 'package:store/services/update_product_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Addpage extends StatefulWidget {

  static String id='add_product';



  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  String? title;

  dynamic price;

  String? description;

  String? image;

  String? category;

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Add Product',style: TextStyle(color: Colors.blue),),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child:SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50,),
                CustomTextFormField(
                  hinttext: 'Product name',
                   onchange: (data){
                    title=data;
                   }
                   ),
                   SizedBox(height: 10,),
                   CustomTextFormField(
                  hinttext: 'description',
                   onchange: (data){
                    description=data;
                   }
                   ),
                   SizedBox(height: 10,),
                   CustomTextFormField(
                    inputType: TextInputType.number,
                  hinttext: 'price',
                   onchange: (data){
                    price=double.parse(data);
                   }
                   ),
                   SizedBox(height: 10,),
                   CustomTextFormField(
                  hinttext: 'image',
                   onchange: (data){
                      image=data;
                   }
                   ),
                   SizedBox(height: 10,),
                   CustomTextFormField(
                  hinttext: 'category',
                   onchange: (data){
                      category=data;
                   }
                   ),
                   SizedBox(height: 50,),
                   CustomButton(
                    text: 'ADD',
                    onpressed: ()async{
                      setState(() {
                        isLoading=true;
                      });
                      try {
                            await addnewproduct();
                            print('success');
                           }catch (e) {
                            print('failed');
                           }
                           setState(() {
                        isLoading=false;
                      });
                    },
                   )
              ],
              ),
          ), 
        ),
      ),
    );
  }

  Future<void> addnewproduct() async{
    await AddProduct().addproduct(
      title: title!,
      price: price!,
      image: image!,
      categ: category!,
      desc : description!,
      );
  }
}