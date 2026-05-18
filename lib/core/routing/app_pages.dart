import 'package:final_servixa/core/routing/app_router.dart';
import 'package:final_servixa/features/authentication/presentation/screens/login_screen.dart';
import 'package:final_servixa/features/authentication/presentation/screens/otp_screen.dart';
import 'package:final_servixa/features/authentication/presentation/screens/register_screen.dart';
import 'package:final_servixa/features/authentication/presentation/screens/reset_password_screen.dart';
import 'package:final_servixa/features/business-account/presentation/screens/create_business_profile_screen.dart';
import 'package:final_servixa/features/categories/presentation/screens/categories_screen.dart';
import 'package:final_servixa/features/categories/presentation/screens/subcategories_screen.dart';
import 'package:final_servixa/features/home/presentation/screens/home_screen.dart';
import 'package:final_servixa/features/home/presentation/screens/items_screen.dart';
import 'package:final_servixa/features/home/presentation/screens/main_screen.dart';
import 'package:final_servixa/features/map/presentation/screens/map_screen.dart';
import 'package:final_servixa/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:final_servixa/features/profile/presentation/screens/profile_screen.dart';
import 'package:final_servixa/features/search-filters/presentation/screens/search_screen.dart';
import 'package:final_servixa/features/services/presentation/screens/add_service_screen.dart';
import 'package:final_servixa/features/services/presentation/screens/details_screen.dart';
import 'package:final_servixa/features/startup/presentation/screens/onboarding_screens.dart';
import 'package:final_servixa/features/startup/presentation/screens/splash_screen.dart';
import 'package:get/get.dart';


class AppPages {
  static final pages = [
    GetPage(name: AppRouter.splash, page: () => SplashScreen()),

    GetPage(name: AppRouter.onboarding, page: () => OnboardingScreen()),

    GetPage(name: AppRouter.login, page: () => LoginScreen()),
    GetPage(name: AppRouter.register, page: () => RegisterScreen()),
    GetPage(
        name: AppRouter.otp,
        page: () {
          final args = Get.arguments as Map<String, dynamic>;
          return VerificationScreen(
            email: args['email'],
            isRegister: args['isRegister'] ?? false, 
          );
        }),
    GetPage(
        name: AppRouter.resetPassword, 
        page: () {
          final args = Get.arguments as Map<String, dynamic>;
          return ResetPasswordScreen(
            email: args['email'],
            code: args['code'],
          );
        }),

    GetPage(name: AppRouter.main, page: () => MainScreen()),

    GetPage(name: AppRouter.home, page: () => Home()),
    GetPage(name: AppRouter.addService, page: () => AddServiceScreen()),

    GetPage(name: AppRouter.product, page: () => DetailsScreen()),

    GetPage(name: AppRouter.categor, page: () => CategoryScreen()),

    GetPage(name: AppRouter.sub, page: () => SubCategoryScreen()),
    GetPage(name: AppRouter.items, page: () => ItemsScreen()),

    GetPage(name: AppRouter.search, page: () => SearchScreen()),
    GetPage(name: AppRouter.mainProfile, page: () => ProfileScreen()),
    GetPage(name: AppRouter.updateProfile, page:()=>UpdateProfileScreen()),
    GetPage(name: AppRouter.businessProfile, page:()=>BusinessProfileScreen()),
    GetPage(name: AppRouter.mapLocation, page:() => MapScreen()),
  ];
}
 