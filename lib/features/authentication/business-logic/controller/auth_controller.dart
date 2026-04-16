import 'package:dio/dio.dart';
import 'package:final_servixa/core/routing/app_router.dart';
import 'package:final_servixa/features/authentication/data/src/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isloading = false.obs;
  RxBool obscure = false.obs;
  RxBool checked = false.obs;

  AuthService authService = AuthService();

  Future<void> login(
    Function(String) onSuccess,
    Function(String) onError,
    String email,
    String password,
  ) async {
    try {
      isloading.value = true;

      bool result = await authService.login(email, password);

      if (result) {
        onSuccess('Login successful');
        Get.offAllNamed(AppRouter.main);
      } else {
        onError('Login failed');
      }
    } catch (e) {
      onError(e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<void> register(
    Function(String) onSuccess,
    Function(String) onError,
    String firstname,
    String lastname,
    String? email,
    String password,
    String? phone,
  ) async {
    try {
      isloading.value = true;
      await authService.register(firstname, lastname, email, password, phone);
      onSuccess('Registration successful');
      Get.toNamed(AppRouter.otp, arguments: {'email': email});
      isloading.value = false;
    } on DioException catch (e) {
      onError(e.message.toString());
    } finally {
      isloading.value = false;
    }
  }
 Future<void>verify(
    Function(String) onSuccess,
    Function(String) onError,
    String phone,
    String otp,
  ) async {
    try {
      isloading.value = true;
      await authService.verifyCode(phone, otp);
      onSuccess('OTP verification successful');
      Get.offAllNamed(AppRouter.main);
      isloading.value = false;
    } on DioException catch (e) {
      onError(e.message.toString());
    } finally {
      isloading.value = false;
    }
  }


  Future<void> forgetPassword(
    String email,
    Function(String) onSuccess,
    Function(String) onError,
) async {
  try {
    isloading.value = true;

    await authService.forgetPass(email);

    onSuccess('Code sent to your email');
  } catch (e) {
    onError(e.toString());
  } finally {
    isloading.value = false;
  }
}


Future<void> verifyCode(
    String email,
    String code,
    Function(String) onSuccess,
    Function(String) onError,
) async {
  try {
    isloading.value = true;

    await authService.verifyCode(email, code);

    onSuccess('Code verified');
  } catch (e) {
    onError(e.toString());
  } finally {
    isloading.value = false;
  }
}


Future<void> resetPassword(
    String email,
    String code,
    String password,
    Function(String) onSuccess,
    Function(String) onError,
) async {
  try {
    isloading.value = true;

    await authService.resetPass(email, code, password);

    onSuccess('Password reset successful');
  } catch (e) {
    onError(e.toString());
  } finally {
    isloading.value = false;
  }
}


  Future<void> logout(Function(String) onSuccess,Function(String) onError,) async {
    try {
      isloading.value = true;
     await authService.logout();
      onSuccess('Logged out successfully.');
      Get.offAllNamed(AppRouter.login);
     isloading.value = false;
    }on DioException catch (e) {
      onError(e.message.toString());
    }
    finally {
      isloading.value = false;
    }
  }

}
