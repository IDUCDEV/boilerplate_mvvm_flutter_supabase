import 'package:supabase_flutter/supabase_flutter.dart';


class AuthRepository {
  final SupabaseClient supabase;

  AuthRepository({required this.supabase});

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

  Future<void> logout() async {
    await supabase.auth.signOut();
  }

  bool get isLoggedIn => supabase.auth.currentUser != null;
}
