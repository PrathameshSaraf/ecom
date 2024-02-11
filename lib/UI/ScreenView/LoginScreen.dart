import 'package:ecom/UI/Components/CustomAppBar.dart';
import 'package:ecom/UI/Components/CustomTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:stacked_services/stacked_services.dart';

import '../../App/app.locator.dart';
import '../../App/app.router.dart';

import '../../Provider/LoginProvider.dart';
import '../../Service/AuthFirebase.dart';
import '../../themes/app_text.dart';
import '../Components/CustomButton.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final auth = new AuthManager();
   @override
  Widget build(BuildContext context) {
     final authProvider = Provider.of<MyAuthProvider>(context);
    return Scaffold(
       body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height-10,
          margin: const EdgeInsets.only(top: 8, left: 32, right: 32).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              80.verticalSpace,
              AppText(
                  "Log In 😃",
                  context,
                  textAlign: TextAlign.left,
                  fontSize: 22,
                   fontWeight: FontWeight.bold
              ).heading3,
              5.verticalSpace,
              AppText(
                 "Welcome in Ecom",
                  context,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.normal,
                  fontSize: 15
              ).bodyVerySmall,
              15.verticalSpace,
              CustomTextField(labelText: "Email", onChange:(v){
                 authProvider.email=v;
                 authProvider.notifyListeners();
              }, width:MediaQuery.of(context).size.width, keyboardType:TextInputType.text),
              15.verticalSpace,
              CustomTextField(labelText: "Password", onChange:(v){
                authProvider.password=v;
                authProvider.notifyListeners();
              }, width:MediaQuery.of(context).size.width, keyboardType:TextInputType.text),
              2.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: (){
                        locator<NavigationService>().navigateTo(Routes.signupScreen);
                      },
                      child: AppText("New User Sign In", context,color: Color(0xffa00500),fontSize: 10).bodyXSmall)
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: AppText(
                    "By Continuing, I agree to the terms and conditions",
                    context,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.normal,
                    fontSize: 12
                ).bodySmall,
              ),
              1.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20).r,
                child: CustomButton(
                  width: 300,
                  height: 40,
                  opacity: 1,
                  context: context,
                  buttonText: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AppText("Log In", context,
                          fontSize:18.sp,
                          color: Colors.white
                      )
                          .heading5,
                    ],
                  ),
                  onTap: () {
                    print(authProvider.email);
                    print(authProvider.password);
                    auth.loginUser(context, authProvider.email!, authProvider.password!).then((value) {
                      if(value) {
                        locator<NavigationService>().navigateTo(Routes
                            .homeScreen);
                      }else{
                        return;
                      }
                    });
                    }

                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
