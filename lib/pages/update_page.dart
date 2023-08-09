

import 'package:flutter/material.dart';
import 'package:store/custom_componant/custom_button.dart';
import 'package:store/custom_componant/custom_textfeild.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdatePage extends StatefulWidget {

  static String id='update_page';

  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? title;

  double? price;

  String? description;

  String? image;

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {

    ProductModal product=ModalRoute.of(context)!.settings.arguments as ProductModal;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Update Product',style: TextStyle(color: Colors.blue),),
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
                   SizedBox(height: 50,),
                   CustomButton(
                    text: 'Update',
                    onpressed: ()async{
                      setState(() {
                        isLoading=true;
                      });
                      try {
                            await updataproduct(product);
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

  Future<void> updataproduct(ProductModal product) async{
    await UpdateProduct().update(
      id: product.id,
      title: title==null? product.title : title!,
      price: price==null? product.price : price!,
      image: image==null? product.image : image!,
      categ: product.category,
      desc :  description==null? product.discreption : description!,
      );
  }
}