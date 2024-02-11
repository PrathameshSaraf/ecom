import 'package:ecom/Provider/LoginProvider.dart';
import 'package:ecom/Provider/ProductProivder.dart';
import 'package:ecom/themes/app_colors.dart';
import 'package:ecom/themes/extension.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:stacked_services/stacked_services.dart';

import 'App/app.locator.dart';
import 'App/app.router.dart';
import 'Service/AuthFirebase.dart';
import 'firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  // Initialize services before the app starts
  servicesToInitialiseBeforeAppStart() ;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authManager = AuthManager();
  final bool isLoggedIn = await authManager.isUserLoggedIn();
  print(isLoggedIn);
    runApp( MyApp(isLoggedIn: isLoggedIn,),);
}

Future<void> servicesToInitialiseBeforeAppStart() async {

  locator.registerLazySingleton(() => NavigationService());
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
              providers: [
              ChangeNotifierProvider(create: (_) => MyAuthProvider()),
              ChangeNotifierProvider(create: (_) {
                final productProvider=ProductProvider();
               productProvider.fetchingProduct();
               return productProvider;
              })  // Provide MyAuthProvider
          ],
          child: MaterialApp(
            title: 'Ecom',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor:
              context.colorScheme.appBackGroundColor,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(
                    color: context.colorScheme.appbarIconColor),
              ),
            ),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
            initialRoute: isLoggedIn?Routes.homeScreen:Routes.loginScreen,
          ));
        },
    );
  }
}

