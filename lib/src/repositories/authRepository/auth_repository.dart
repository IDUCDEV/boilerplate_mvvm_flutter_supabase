import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final SupabaseClient supabase;

  AuthRepository({required this.supabase});

  @override
  Future<bool> login(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (_) {
      return false;
    }
  }
  @override
  Future<void> logout() async {
    await supabase.auth.signOut();
  }
  
  @override
  bool get isLoggedIn => supabase.auth.currentUser != null;
}
