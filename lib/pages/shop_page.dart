import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/components/retry_button.dart';
import 'package:flutter_shopping_app/components/shop_item.dart';
import 'package:flutter_shopping_app/controllers/products_controller.dart';
import 'package:flutter_shopping_app/resources/strings.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController searchController = TextEditingController();

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
              const Text(
                Strings.welcomeBack,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: Strings.search,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  productController.searchProducts(value);
                  setState(() {});
                },
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Consumer<ProductsController>(
                  builder: (context, productsController, child) {
                    if (productsController.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (productsController.products.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Strings.noProducts,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: 100,
                              child: Card(
                                elevation: 5,
                                child: RetryButton(
                                  productsController: productsController,
                                  buttonText: Strings.retry,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      if (productController.filteredProducts.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Strings.noProducts,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: 100,
                                child: Card(
                                  elevation: 5,
                                  child: RetryButton(
                                    productsController: productsController,
                                    buttonText: Strings.retry,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return GridView.builder(
                          padding: const EdgeInsets.only(top: 16),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemCount: productController.filteredProducts.length,
                          itemBuilder: (BuildContext context, int index) {
                            final product =
                                productController.filteredProducts[index];
                            return ShopItem(
                              id: product.id,
                              title: product.title,
                              description: product.description,
                              price: product.price,
                              image: product.image,
                              isGridView: true,
                              isAdded: product.isAdded,
                              itemCount: product.itemCount,
                            );
                          },
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
