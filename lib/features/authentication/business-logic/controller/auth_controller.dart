import 'package:dio/dio.dart';
import 'package:final_servixa/core/routing/app_router.dart';
import 'package:final_servixa/features/authentication/data/src/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isloading = false.obs;
 RxBool obscurePassword = true.obs;
 RxBool obscureConfirm = true.obs;
  RxBool obscureNewPassword = true.obs;
  RxBool obscureConfirmPassword = true.obs;
  RxBool obscureRegisterPassword = true.obs; 
  RxBool obscureRegisterConfirmPassword = true.obs; 
  RxBool agreeToTerms = false.obs; 

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
    String firstName,
    String lastName,
    String email,
    String password,
    Function(String) onSuccess,
    Function(String) onError,
  ) async {
    try {
      isloading.value = true;
      await authService.register(firstName, lastName, email, password);
      onSuccess('Registration successful. Please verify your email.');
      Get.toNamed(AppRouter.otp, arguments: {'email': email, 'isRegister': true});
    } catch (e) {
      onError(e.toString());
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

  Future<void> verifyEmail(
    String email,
    String code,
    Function(String) onSuccess,
    Function(String) onError,
  ) async {
    try {
      isloading.value = true;
      await authService.verifyEmail(email, code);
      onSuccess('Email verified successfully.');
      Get.offAllNamed(AppRouter.login); // Go to login after successful email verification
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
      Get.offAllNamed(AppRouter.login); // Navigate to login after successful reset
    } catch (e) {
      onError(e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<void> logout(Function(String) onSuccess, Function(String) onError,) async {
    try {
      isloading.value = true;
      await authService.logout();
      onSuccess('Logged out successfully.');
      Get.offAllNamed(AppRouter.login);
      isloading.value = false;
    } on DioException catch (e) {
      onError(e.message.toString());
    } finally {
      isloading.value = false;
    }
  }
}
