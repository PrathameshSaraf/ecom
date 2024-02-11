import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/productModel.dart';
import '../../Provider/ProductProivder.dart';
import '../../themes/app_text.dart';

Widget getAddButton({
  required String name,
  required ProductModel product,
  required BuildContext context,
}) {
  final productProvider = Provider.of<ProductProvider>(context, listen: true);
  final cartCount = productProvider.cartList[product.id.toString()] ?? 0;

  return cartCount > 0
      ? Container(
    width: 100,
    height: 40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: const Color(0xFF351985)),
      color: const Color(0xFFF4F4FF),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            productProvider.decrementProduct(product.id.toString());
            productProvider.notifyListeners();
          },
          child: Icon(Icons.remove, size: 20),
        ),
        AppText(
          cartCount.toString(),
          context,fontSize: 10
        ).bodySmall,
        GestureDetector(
          onTap: () {
            productProvider.incrementProduct(product.id.toString());
            productProvider.notifyListeners();
          },
          child: Icon(Icons.add, size: 20),
        ),
      ],
    ),
  )
      : GestureDetector(
    onTap: () {
      productProvider.addToCart(product.id.toString());
      productProvider.notifyListeners();
    },
    child: Container(
      width: 70,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xFF351985)),
        color: const Color(0xFFF4F4FF),
      ),
      child: Center(
        child: AppText(
          "Add",
          context,fontSize: 15
        ).bodySmall,
      ),
    ),
  );
}

