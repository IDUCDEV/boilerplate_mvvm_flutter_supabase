import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'auth_service_interface.dart';

class SupabaseService implements IAuthService {
  static Future<void> initializeSupabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
    );
  }

  final client = Supabase.instance.client;

  @override
  Future<void> initialize() async {
    // Supabase is already initialized globally
  }

  @override
  Future<bool> login(String email, String password) async {
    try {
      await client.auth.signInWithPassword(
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
    await client.auth.signOut();
  }

  @override
  bool get isLoggedIn => client.auth.currentUser != null;
}

