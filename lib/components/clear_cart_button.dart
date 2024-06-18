import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/controllers/products_controller.dart';
import 'package:flutter_shopping_app/resources/strings.dart';

class ClearCartButton extends StatelessWidget {
  final ProductsController productController;
  final String buttonText;

  const ClearCartButton({
    super.key,
    required this.productController,
    required this.buttonText,
  });

  Future<void> _showClearCartDialog(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(Strings.clearCart),
        content: const Text(Strings.clearCartConfirmation),
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

    if (confirmed == true) {
      productController.clearCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showClearCartDialog(context),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => _showClearCartDialog(context),
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
