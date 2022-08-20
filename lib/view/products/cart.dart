



import 'package:alpha/utils/widgets/Buttons/icon_button.dart';
import 'package:alpha/utils/widgets/custom_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Screen"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Center(
              child: Badge(
                badgeContent: CustomText(
                title: "0",
                color: Colors.white,
                ),
                child: Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  child: ListTile(
                    leading:CircleAvatar(
                      radius: 20,
                    ),
                    title: Text("Iphone"),
                    subtitle: Text("Price"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       CustomIconButton(
                        onTap: (){},
                        icon:Icons.remove
                        ),
                        CustomText(
                        title: "0",
                        fontSize: 16,
                        ),
                        CustomIconButton(
                          onTap: (){},
                        icon:Icons.add
                        ),
                        SizedBox(width: 15,),
                        CustomIconButton(
                          onTap: (){},
                        icon: Icons.delete,
                        color: Colors.red,
                       ),
                      ],
                    ),
                  ),
                );
              }, 
              separatorBuilder: (BuildContext context, int index){
                return SizedBox(height: 10,);
              },
              ),
          )
        ],
      ),
    
    );
  }
}

