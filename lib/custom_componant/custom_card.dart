import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/pages/product_page.dart';
import 'package:store/pages/update_page.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.product});

  ProductModal product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductPage.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 140,
            width: 300,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 0.1,
                offset: Offset(1, 1),
              )
            ]),
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 6),
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$''${product.price}',
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite),
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Image.network(
              product.image,
              height: 110,
              width: 110,
            ),
            left: 60,
            bottom: 120,
          ),
        ],
      ),
    );
  }
}
