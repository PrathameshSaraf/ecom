import 'package:ecom/UI/Components/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../App/app.locator.dart';
import '../../App/app.router.dart';
import '../../Provider/ProductProivder.dart';
import '../../themes/app_text.dart';

class OrderPlacedPage extends StatefulWidget {
  @override
  _OrderPlacedPageState createState() => _OrderPlacedPageState();
}

class _OrderPlacedPageState extends State<OrderPlacedPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );


    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          200.verticalSpace,
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _animation,
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 100,
                  ),
                ),
                SizedBox(height: 20),
                FadeTransition(
                  opacity: _animation,
                  child: AppText(
                    'Order Placed',
                    context,
                  ).bodyMedium,
                ),
                SizedBox(height: 10),
                FadeTransition(
                  opacity: _animation,
                  child: AppText(
                    'Thank you for choosing!',
                    context,
                    fontSize: 18
                  ).bodyMedium,
                ),
              ],
            ),
          ),
          250.verticalSpace,
          CustomButton(context: context, onTap:(){
            Provider.of<ProductProvider>(context, listen: false).clearCart();
            Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
          }, buttonText: Center(child: AppText("Home Menu",context,color: Colors.white).bodyMedium),
              opacity: 1, height: 40, width: MediaQuery.of(context).size.width-100)
        ],
      ),
    );
  }
}

