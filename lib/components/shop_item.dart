import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/controllers/products_controller.dart';
import 'package:flutter_shopping_app/resources/strings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ShopItem extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final num price;
  final ImageProvider image;
  final bool isGridView;
  bool isAdded;
  int itemCount;

  ShopItem({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.isGridView,
    required this.isAdded,
    required this.itemCount,
  });

  @override
  ShopItemState createState() => ShopItemState();
}

class ShopItemState extends State<ShopItem> {
  Future<bool> showRemoveFromCartAlert() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(Strings.remove),
        content: const Text(Strings.removeFromCartConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(Strings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(Strings.remove),
          ),
        ],
      ),
    );
  }

  void _addToCart() {
    widget.isAdded = true;
    final productController =
        Provider.of<ProductsController>(context, listen: false);
    productController.addToCart(widget.id);
    showAddToCartAlert();
    setState(() {});
  }

  void _removeFromCart() async {
    final confirmed = await showRemoveFromCartAlert();
    if (confirmed) {
      widget.isAdded = false;
      final productController =
          Provider.of<ProductsController>(context, listen: false);
      productController.removeFromCart(widget.id);
      setState(() {});
    }
  }

  void _incrementCount() {
    final productController =
        Provider.of<ProductsController>(context, listen: false);
    productController.incrementCount(widget.id);
    setState(() {});
  }

  void _decrementCount() {
    final productController =
        Provider.of<ProductsController>(context, listen: false);
    if (widget.itemCount == 1) {
      _removeFromCart();
    } else {
      productController.decrementCount(widget.id);
    }
    setState(() {});
  }

  void showAddToCartAlert() {
    Fluttertoast.showToast(
        msg: Strings.addToCart,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[700],
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isGridView) {
      return Card(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        elevation: 5,
        child: Container(
          height: widget.isAdded ? 180 : 150,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: widget.isAdded ? 50 : 80,
                width: widget.isAdded ? 50 : 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: widget.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(
                            "€ ${widget.price.toString()}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: _addToCart,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.add_shopping_cart_outlined,
                                size: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Visibility(
                        visible: widget.isAdded,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: _decrementCount,
                                child: const Icon(
                                  Icons.remove_circle_outline,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Center(
                                child: Text(
                                  widget.itemCount.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: _incrementCount,
                                child: const Icon(
                                  Icons.add_circle_outline,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Card(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        elevation: 5,
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(8.0),
          width: 100,
          margin: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: widget.image,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "€ ${widget.price}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Visibility(
                        visible: widget.isAdded,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Center(
                                child: Text(
                                  Strings.qty,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              InkWell(
                                onTap: _decrementCount,
                                child: const Icon(
                                  Icons.remove_circle_outline,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Center(
                                child: Text(
                                  widget.itemCount.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: _incrementCount,
                                child: const Icon(
                                  Icons.add_circle_outline,
                                  size: 22,
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: _removeFromCart,
                                child: const Icon(
                                  Icons.delete,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
