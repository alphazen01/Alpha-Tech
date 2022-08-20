import 'package:alpha/controller/cart_controller.dart';
import 'package:alpha/controller/products_controller.dart';
import 'package:alpha/utils/constant/enum.dart';
import 'package:alpha/utils/constant/function/custom_drawer.dart';
import 'package:alpha/utils/constant/loading.dart';
import 'package:alpha/utils/widgets/Buttons/custom_button.dart';
import 'package:alpha/view/products/cart.dart';
import 'package:alpha/view/products/details_screen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../models/products_model.dart';
import '../../utils/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Loading load = Loading();
  

  double get productPrice => 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final data = Provider.of<ProductsController>(context, listen: false);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => data.fetchProducts(context));
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartController>(context);
    return SafeArea(
      child: Scaffold(
       drawer: Drawer(
          child: CustomDrawer(),
        ),
        appBar: AppBar(
          leading: Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    size: 32,
                  ));
            }),
          actions: [
            Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: Badge(
                badgeColor:Colors.green ,
                badgeContent: Consumer<CartController>(
                    builder: (context, cartController, child) =>
                        Text(cartController.count.toString())),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>CartScreen()));
                  },
                    child: Icon(
                  Icons.shopping_cart,
                  size: 30,
                )),
              ),
            ),
          ),
          
          ],
        
        ),
        body: Consumer<ProductsController>(
            builder: (context, productsController, child) {
          if (productsController.dataState == DataState.loading) {
            return Center(child: load.loader());
          } else if (productsController.dataState == DataState.loaded) {
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10,),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: productsController.productstModel.products!.length,
              itemBuilder: ((context, index) {
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>
                            DetailsScreen(product:productsController.productstModel.products![index])));
                          },
                          child: AspectRatio(
                            aspectRatio: 2,
                            child: Image.network(
                                productsController
                                  .productstModel.products![index].thumbnail!,
                                scale: 3),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          productsController
                              .productstModel.products![index].title
                              .toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Expanded(
                        child: CustomText(
                          title: "${ productsController
                              .productstModel.products![index].price} \$",
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                        ),
                      ),
                      CustomButton(
                          title: "Add to cart",
                          color: Colors.green,
                          onTap: () {
                            cart.increment();
                            cart.addTotalPrice(productPrice);
                          },
                          radius: 10),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                );
              }),
            );
          } else {
            return Text('Something else');
          }
        }),
      ),
    );
  }
}
