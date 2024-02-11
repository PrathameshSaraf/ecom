import 'package:flutter/cupertino.dart';

import '../Model/productModel.dart';
import '../Service/http_Service.dart';

class ProductProvider extends ChangeNotifier{
   List<ProductModel> fetchedProductList=[];
   List<ProductModel> categoryProductList=[];
   Map<String, int> cartList={};
   bool isSelectedCategory=false;

   final http=new ProductService();


   void addToCart(String productId) {
     if (cartList.containsKey(productId)) {
       cartList[productId] = cartList[productId]! + 1;
     } else {
       cartList[productId] = 1;
     }
     notifyListeners();
   }

   void incrementProduct(String productId) {
     if (cartList.containsKey(productId)) {
       cartList[productId] = cartList[productId]! + 1;
     } else {
       cartList[productId] = 1;
     }
     notifyListeners();
   }

   void decrementProduct(String productId) {
     if (cartList.containsKey(productId)) {
       if (cartList[productId]! > 1) {
         cartList[productId] = cartList[productId]! - 1;
       } else {
         cartList.remove(productId);
       }
       notifyListeners();
     }
   }

   void clearCart() {
     cartList={};
     notifyListeners();
   }
   void fetchingProduct()async{
     fetchedProductList= await http.fetchProducts();
     categoryProductList=fetchedProductList;
     notifyListeners();
   }

   List<ProductModel> getProductsByCategory(String category) {
     print(category);
     if(category!="All"){
     categoryProductList = fetchedProductList.where((product) => product.category == category).toList();
     }else{
       categoryProductList=fetchedProductList;
     }
     print(categoryProductList.length);
     notifyListeners();
     return categoryProductList;
   }

   ProductModel? findProduct(String productId) {
     for (ProductModel product in fetchedProductList) {

       if (product.id.toString() == productId) {
         print(product.title);
         return product;
       }
     }
   }

   double calculateTotalCost() {
     double totalCost = 0;
     cartList.forEach((productId, quantity) {
       ProductModel? product = fetchedProductList.firstWhere((product) => product.id.toString() == productId.toString(), orElse: () =>
           ProductModel(id: 0, title: '', price: 0,image: '',rating:Rating(rate:0.0, count: 0), description: '', category: '',));
       if (product != null) {
         totalCost += product.price * quantity;
       }
     });
     return totalCost;
   }
}