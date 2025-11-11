import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IAuthRepository {
  Future<bool> login(String email, String password);
  Future<void> logout();
  bool get isLoggedIn;
}
