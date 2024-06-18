import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/controllers/products_controller.dart';

class RetryButton extends StatelessWidget {
  final ProductsController productsController;
  final String buttonText;

  const RetryButton({
    super.key,
    required this.productsController,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        productsController.loadProductsFromRepo();
      },
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              productsController.loadProductsFromRepo();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
