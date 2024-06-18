import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/components/clear_cart_button.dart';
import 'package:flutter_shopping_app/components/shop_item.dart';
import 'package:flutter_shopping_app/controllers/products_controller.dart';
import 'package:flutter_shopping_app/resources/strings.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductsController>(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    Strings.yourcart,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  ClearCartButton(
                    productController: productController,
                    buttonText: Strings.clearCart,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Consumer<ProductsController>(
                  builder: (context, cartController, child) {
                    final addedProducts = productController.filteredProducts
                        .where((item) => item.isAdded)
                        .toList();

                    if (addedProducts.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Strings.emptyCart,
                              height: 150,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              Strings.noItemsInCart,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: addedProducts.length,
                      itemBuilder: (context, index) {
                        final item = addedProducts[index];
                        return ShopItem(
                          id: item.id,
                          title: item.title,
                          description: item.description,
                          price: item.price,
                          image: item.image,
                          isGridView: false,
                          isAdded: item.isAdded,
                          itemCount: item.itemCount,
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Consumer<ProductsController>(
                builder: (context, productsController, child) {
                  final addedProducts = productController.filteredProducts
                      .where((item) => item.isAdded)
                      .toList();
                  if (addedProducts.isEmpty) {
                    return Container();
                  } else {
                    return Center(
                      child: Text(
                        "Total: € ${productController.totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
