import 'package:flutter/material.dart';
import '../repositories/authRepository/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository authRepository;

  bool isLoading = false;
  String? errorMessage;

  AuthViewModel({required this.authRepository});

  Future<bool> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    final success = await authRepository.login(email, password);
    isLoading = false;

    if (!success) {
      errorMessage = "Credenciales inválidas o error de conexión";
    } else {
      errorMessage = null;
    }

    notifyListeners();
    return success;
  }

  Future<void> logout() async {
    await authRepository.logout();
    notifyListeners();
  }

  bool get isAuthenticated => authRepository.isLoggedIn;
}
