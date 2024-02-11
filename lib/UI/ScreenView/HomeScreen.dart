import 'package:ecom/Model/productModel.dart';
import 'package:ecom/Provider/ProductProivder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../App/app.locator.dart';
import '../../App/app.router.dart';
import '../../Service/AuthFirebase.dart';
import '../../themes/app_text.dart';
import '../Components/Item.dart';
import '../Components/getButton.dart';
List<String> genre = [
  "👔 men's clothing",
  "💍 jewelery",
  "📱 electronics",
  "👗 women's clothing"
];

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
   ScrollController controller = ScrollController();
   int selectedIndex = -1;


  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
      floatingActionButton: productProvider.cartList.length>0? Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () async {
                  locator<NavigationService>().navigateTo(Routes.cartPage);
                },
                child: Container(
                  width: 151,
                  height: 48,
                  decoration: BoxDecoration(
                      color: const Color(0xff88001f),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.shopping_cart_outlined,
                          color: Colors.white),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'View Cart ${productProvider.cartList.length}',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
    ):SizedBox(),
      appBar: createAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 212,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xf0ff6860),
                            Colors.white
                          ])),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                          width: 260.w,
                          height: 160.w,
                          child: Image.network("https://img.freepik.com/free-vector/shop-with-sign-we-are-open_52683-38687.jpg")),
                      AppText("Saraf",context,fontSize: 22).bodyMedium,
                      AppText("Pune, Maharashtra",context,fontWeight: FontWeight.normal).bodyMedium,
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: AppText('Filters', context,fontSize: 17,).bodyMedium),
                    5.verticalSpace,
                    SizedBox(
                      height: 32,
                      width: double.infinity,
                      child: Center(
                        child: ListView.builder(
                          controller: controller,
                          itemCount: genre.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {

                                return GestureDetector(
                                  onTap: () {
                                    if (selectedIndex == index) {
                                      selectedIndex = -1;
                                    } else {
                                      selectedIndex = index;
                                    }
                                    if(selectedIndex!=-1){
                                    productProvider.getProductsByCategory(genre[index].replaceAll(RegExp(r'[^\x00-\x7F\s]+'), '').trim());
                                    productProvider.notifyListeners();
                                    }else{
                                      productProvider.getProductsByCategory("All");
                                      productProvider.notifyListeners();
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 4),
                                      decoration: BoxDecoration(
                                          color:selectedIndex == index ? Colors.green : Color(0xff88001f),
                                          border: Border.all(
                                              color:
                                              const Color(0xFFF4F4FF)),
                                          borderRadius:
                                          BorderRadius.circular(4)),
                                      child: Center(
                                        child: Text(genre[index],
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            )),
                                      ),
                                    ),
                                  ),
                                );

                              },

                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(thickness: 2,),
            Column(
              children:
                List.generate(
                    productProvider.categoryProductList.length,
                        (index) => Container(
                          child: Column(
                            children: [
                              Item(
                              product:  productProvider.categoryProductList[index],
                              image: productProvider.categoryProductList[index].image,
                              desc: productProvider.categoryProductList[index].description,
                              price: productProvider.categoryProductList[index].price,
                              name: productProvider.categoryProductList[index].title,
                              rating: productProvider.categoryProductList[index].rating.rate,
                              tags: [productProvider.categoryProductList[index].category]
                             ),
                              Divider(),
                            ],
                          ),
                        )),

            ),

          ],
        ),
      ),
    );
  }
}


createAppBar(BuildContext context) {
  final AuthManager _authManager = AuthManager();
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        AppText("My Shop",context,fontSize: 20).bodyMedium,
      ],
    ),
    actions: [
      IconButton(
        icon: Icon(Icons.logout),
        onPressed: () {
          _authManager.logoutUser(context);
        },
      ),
    ],
  );
}

