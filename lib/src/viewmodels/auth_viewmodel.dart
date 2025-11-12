import 'package:flutter/material.dart';
import '../repositories/authRepository/auth_repository_interface.dart';

class AuthViewModel extends ChangeNotifier {
  final IAuthRepository authRepository;
  AuthViewModel({required this.authRepository});

  bool isLoading = false;
  String? errorMessage;
  bool get isAuthenticated => authRepository.isLoggedIn;

  

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

  
}
