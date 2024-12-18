import 'package:go_router/go_router.dart';
import 'package:supabaselearning/core/extension.dart';
import 'package:supabaselearning/features/auth/pages/sign_up_page.dart';
import 'package:supabaselearning/features/home/pages/home_page.dart';

class AppRouteName {
  static final String signUp = "sign-up";
  static final String home = "home";
}

class AppRoute {
  static GoRouter goRoute =
      GoRouter(initialLocation: AppRouteName.signUp.path(), routes: [
    GoRoute(
      path: AppRouteName.signUp.path(),
      name: AppRouteName.signUp,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: AppRouteName.home.path(),
      name: AppRouteName.home,
      builder: (context, state) => HomePage(),
    ),
  ]);
}
