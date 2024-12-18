import 'package:supabase_flutter/supabase_flutter.dart';

sealed class BaseAuthRepository {
  Future<void> signUpWithEmail(
      {required String email, required String password});
}

class AuthRepositoryImpl implements BaseAuthRepository {
  final Supabase _supabase = Supabase.instance;
  @override
  Future<void> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      await _supabase.client.auth.signUp(password: password, email: email);
    } catch (e) {
      rethrow;
    }
  }
}
