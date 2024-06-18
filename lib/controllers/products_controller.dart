import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/components/shop_item.dart';
import 'package:flutter_shopping_app/repositories/product_repository.dart';

class ProductsController extends ChangeNotifier {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  final GlobalKey<NavigatorState> navigatorKey;
  ProductsRepository productsRepository = ProductsRepository();
  bool loading = false;
  List apiProducts = [];
  List<ShopItem> products = [];
  List<ShopItem> filteredProducts = [];

  ProductsController(
    this.scaffoldMessengerKey,
    this.navigatorKey,
  ) {
    loadProductsFromRepo();
  }

  Future<void> loadProductsFromRepo() async {
    try {
      loading = true;
      notifyListeners();

      var loadedProducts = await productsRepository.loadProductsFromApi();
      if (loadedProducts != null) {
        apiProducts = loadedProducts;
        products = apiProducts
            .map((product) => ShopItem(
                  id: product['id'] - 1,
                  title: product['title'],
                  description: product['description'],
                  price: product['price'],
                  image: NetworkImage(product['image']),
                  isGridView: false,
                  isAdded: false,
                  itemCount: 0,
                ))
            .toList();
        filteredProducts = products;
      } else {
        products = [];
        scaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(
            content: Text('Failed to load products. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text('Failed to load products: $error'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      filteredProducts = products;
    } else {
      filteredProducts = products
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void addToCart(int id) {
    if (filteredProducts[id].isAdded == false) {
      filteredProducts[id].isAdded = true;
      filteredProducts[id].itemCount++;
    } else {
      filteredProducts[id].itemCount++;
    }
    notifyListeners();
  }

  void removeFromCart(int id) {
    if (filteredProducts[id].isAdded == true) {
      filteredProducts[id].isAdded = false;
      filteredProducts[id].itemCount = 0;
      notifyListeners();
    }
  }

  void incrementCount(int id) {
    if (filteredProducts[id].isAdded == true) {
      filteredProducts[id].itemCount++;
      notifyListeners();
    }
  }

  void decrementCount(int id) {
    if (filteredProducts[id].isAdded == true) {
      if (filteredProducts[id].itemCount == 1) {
        removeFromCart(id);
      } else {
        filteredProducts[id].itemCount--;
      }
      notifyListeners();
    }
  }

  Future<void> clearCart() async {
    if (products.isNotEmpty) {
      for (var item in products) {
        item.isAdded = false;
        item.itemCount = 0;
      }
      notifyListeners();
    }
  }

  double get totalPrice {
    final addedProducts = products.where((item) => item.isAdded).toList();
    return addedProducts.fold(
        0, (sum, item) => sum + (item.price * item.itemCount));
  }

  int get totalItems {
    final addedProducts = products.where((item) => item.isAdded).toList();
    return addedProducts.fold(0, (totalQty, item) => totalQty + item.itemCount);
  }
}
