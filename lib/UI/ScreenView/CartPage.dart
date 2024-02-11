import 'package:ecom/Model/productModel.dart';
import 'package:ecom/UI/Components/CustomAppBar.dart';
import 'package:ecom/UI/Components/CustomButton.dart';
import 'package:ecom/UI/Components/CustomTextField.dart';
import 'package:ecom/themes/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../App/app.locator.dart';
import '../../App/app.router.dart';
import '../../Provider/ProductProivder.dart';
import '../Components/getButton.dart';
import 'HomeScreen.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: true);
    double total = productProvider.calculateTotalCost();
    return Scaffold(
      appBar: CustomAppBar(title: "My Card 🛒"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //height: MediaQuery.of(context).size.height-110,
            margin: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                AppText("Verify Order🛍️ Details and fill the form 📝", context,
                        fontWeight: FontWeight.normal)
                    .bodyMedium,
                10.verticalSpace,
                CustomTextField(
                    labelText: "Name",
                    onChange: (v) {},
                    width: MediaQuery.of(context).size.width - 20,
                    keyboardType: TextInputType.text),
                20.verticalSpace,
                CustomTextField(
                    labelText: "Mobile Number",
                    onChange: (v) {},
                    width: MediaQuery.of(context).size.width - 20,
                    keyboardType: TextInputType.number),
                20.verticalSpace,
                CustomTextField(
                  labelText: "Address",
                  onChange: (v) {},
                  width: MediaQuery.of(context).size.width - 20,
                  keyboardType: TextInputType.text,
                  maxLine: 2,
                ),
                20.verticalSpace,

                //cart Items
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 0, 16),
                  child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11),
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 2,
                                color: Color.fromARGB(124, 0, 0, 0),
                                blurRadius: 8)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText("Order Details", context).bodyMedium,
                          10.verticalSpace,
                          Column(
                            children: List.generate(
                                productProvider.cartList.length, (index) {
                              List<String> productIds =
                                  productProvider.cartList.keys.toList();
                              ProductModel? product = productProvider
                                  .findProduct(productIds[index]);
                              return Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 43,
                                            height: 43,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: const Color(0xFFD9D9D9),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            child: Image.network(
                                              product!.image,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          SizedBox(
                                            width: 253 / 2,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 297 / 2,
                                                  child: Text(
                                                    product!.title,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Rs ${product!.price}  ',
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 25,
                                                    ),
                                                    SizedBox(
                                                      child: Text(
                                                        'Qty: ${2} ',
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 8),
                                      SizedBox(
                                          child: getAddButton(
                                              name: "Add",
                                              product: product,
                                              context: context))
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                          20.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppText("Total Rs.", context).bodyMedium,
                              2.horizontalSpace,
                              AppText(total.toStringAsFixed(2), context)
                                  .bodyMedium,
                            ],
                          )
                        ],
                      )),
                ),
                20.verticalSpace,
                CustomButton(
                    context: context,
                    onTap: () {
                      locator<NavigationService>()
                          .navigateTo(Routes.orderPlacedPage);
                    },
                    buttonText: Center(
                        child:
                            AppText("Place Order", context, color: Colors.white)
                                .bodyMedium),
                    opacity: 1,
                    height: 40,
                    width: MediaQuery.of(context).size.width - 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
