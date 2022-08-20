import 'package:alpha/models/products_model.dart';
import 'package:alpha/utils/constant/theme.dart';
import 'package:alpha/utils/widgets/Buttons/custom_button.dart';
import 'package:alpha/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailsScreen extends StatefulWidget {
  final  Product product;
   DetailsScreen({Key? key,
   required this.product
   }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: CustomText(
            title: "Product's Details"
          ),
          leading: IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.favorite_border_outlined)
            ),
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PTheme.paddingX),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.teal,
                child: Image.network(
                widget.product.thumbnail!,
                fit: BoxFit.cover,
                ),
              ),
            ),
           
           CustomText(
           title: widget.product.title.toString(),

           fontSize: 24,
            ),
            CustomText(
            title: "${widget.product.description }",
            fontSize: 20,
            ),
              CustomText(
            title: "${widget.product.price } \$",
            fontSize: 24,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomButton( 
              title: "Add to cart", 
              fontSize: 18,
              onTap: (){}, 
              radius: 20,
              color:PTheme.buttonColor,
              
              
              ),
            ),
          ],
        ),
      ),
      ),
    );
    
  }
}