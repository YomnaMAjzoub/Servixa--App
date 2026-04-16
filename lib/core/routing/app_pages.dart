import 'package:final_servixa/core/routing/app_router.dart';
import 'package:final_servixa/features/authentication/presentation/screens/login_screen.dart';
import 'package:final_servixa/features/authentication/presentation/screens/otp_screen.dart';
import 'package:final_servixa/features/authentication/presentation/screens/register_screen.dart';
import 'package:final_servixa/features/startup/presentation/screens/onboarding_screens.dart';
import 'package:final_servixa/features/startup/presentation/screens/splash_screen.dart';
import 'package:get/get.dart';


class AppPages {
  static final pages = [
    GetPage(name: AppRouter.splash, page: () => SplashScreen()),

    GetPage(name: AppRouter.onboarding, page: () => OnboardingScreen()),

    GetPage(name: AppRouter.login, page: () => LoginScreen()),
    GetPage(name: AppRouter.register, page: () => RegisterScreen()),
    GetPage(name: AppRouter.otp, page: () => VerificationScreen(email: Get.arguments['email'])),

 //   GetPage(name: AppRouter.main, page: () => MainScreen()),

  //  GetPage(name: AppRouter.home, page: () => Home()),

  //  GetPage(name: AppRouter.product, page: () => DetailsScreen()),

 //   GetPage(name: AppRouter.categor, page: () => CategoryScreen()),

  //  GetPage(name: AppRouter.sub, page: () => SubCategoryScreen()),
  //  GetPage(name: AppRouter.items, page: () => ItemsScreen()),

  //  GetPage(name: AppRouter.search, page: () => SearchScreen()),
  //  GetPage(name: AppRouter.mainProfile, page: () => ProfileScreen()),
 //   GetPage(name: AppRouter.updateProfile, page:()=>UpdateProfileScreen()),
  ];
}
