import '../../services/auth_service_interface.dart';
import 'auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final IAuthService authService;

  AuthRepository({required this.authService});

  @override
  Future<bool> login(String email, String password) async {
    return await authService.login(email, password);
  }

  @override
  Future<void> logout() async {
    await authService.logout();
  }

  @override
  bool get isLoggedIn => authService.isLoggedIn;
}
