abstract class IAuthService {
  Future<void> initialize();
  Future<bool> login(String email, String password);
  Future<void> logout();
  bool get isLoggedIn;
}