import 'package:flutter_application_2/modules/profile/views/edit_profile_view.dart';
import 'package:get/get.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/views/register_view.dart';  // Tambahkan ini
import '../modules/profile/views/profile_view.dart';
import '../modules/game_detail/views/game_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/register/bindings/register_binding.dart';  // Tambahkan ini
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/game_detail/bindings/game_detail_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,  // Tambahkan ini
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.GAME_DETAIL,
      page: () => GameDetailView(),
      binding: GameDetailBinding(),
    ),
    GetPage(
      name: '/edit-profile',
      page: () => EditProfileView(),
    ),
  ];
}
