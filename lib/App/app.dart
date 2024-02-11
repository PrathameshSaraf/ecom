
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../UI/ScreenView/CartPage.dart';
import '../UI/ScreenView/HomeScreen.dart';
import '../UI/ScreenView/LoginScreen.dart';
import '../UI/ScreenView/SignupScreen.dart';
import '../UI/ScreenView/thankYou.dart';



@StackedApp(
  routes:[
    MaterialRoute(
      page:LoginScreen,
    ),
    MaterialRoute(
      page:SignupScreen,
    ),
    MaterialRoute(
      page:HomeScreen,
      initial: true,
    ),
    MaterialRoute(
      page:CartPage,
    ),
    MaterialRoute(
      page:OrderPlacedPage,
    ),

  ],
  dependencies:[
    LazySingleton(classType: NavigationService),
  ],
  logger: StackedLogger(),
)
class $AppRouter {}


//flutter pub run build_runner build --delete-conflicting-outputs