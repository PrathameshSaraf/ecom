import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Model/productModel.dart';
import '../../themes/app_text.dart';
import '../ScreenView/HomeScreen.dart';
import 'getButton.dart';

class Item extends StatelessWidget {
  Item({super.key,
    required this.product,
    required this.image,
    required this.desc,
    required this.price,
    required this.name,
    required this.rating,
    required this.tags});

  String image, desc, name;
  ProductModel product;
  double price;
  double rating;
  List<String> tags;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 170,
        width: MediaQuery.of(context).size.width-20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: (MediaQuery.of(context).size.width - 35) * 0.25,
                child: Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                        //color: Colors.red,
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                          width: 132,
                          height: 132,
                        ),
                      ),
                      Positioned(
                          bottom: -7,
                          child:  getAddButton(name: "add",product:product,context: context)
                      ),

                    ]
                )
            ),
            10.horizontalSpace,
            SizedBox(
              width: MediaQuery.of(context).size.width-121,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: 32,
                          child:   Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color:  const Color(0xff88001f),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Row(
                                  children: [
                                    AppText( "👔 ${tags.first}"==genre[0]?"👔"
                                        :"💍 ${tags.first}"==genre[1]?"💍"
                                        :"📱 ${tags.first}"==genre[2]?"📱"
                                        :"👗 ${tags.first}"==genre[3]?"👗":tags.first, context,fontSize: 12,color: Colors.white).bodyXSmall
                                  ]
                              ),
                            ),
                          )),
                      Spacer(),
                      Container(
                        width: 100,
                        height: 20,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            // Calculate the star icon based on the current index and rating value
                            IconData iconData = Icons.star;
                            if (index >= rating) {
                              iconData = Icons.star_border;
                            } else if (index > rating - 1 && index < rating) {
                              iconData = Icons.star_half;
                            }
                            return Icon(
                              iconData,
                              size: 20,
                              color: Colors.amber,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width:MediaQuery.of(context).size.width ,
                        child: AppText(name, context,fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2
                        ).bodyMedium,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: AppText("Rs ${price}", context,fontSize: 13,color: Colors.greenAccent).bodyMedium
                      )
                    ],
                  ),
                  2.verticalSpace,
                  SizedBox(
                    child: AppText(desc,
                        context,
                        fontSize: 10,
                        overflow: TextOverflow.fade,
                        maxLines: 4,
                        fontWeight: FontWeight.normal,color: Colors.grey).bodyXSmall,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}