import 'dart:convert';
import 'restApi_service.dart';
import 'auth_service_interface.dart';

class RestApiAuthService implements IAuthService {
  final RestApiService _apiService;
  String? _token;

  RestApiAuthService({required String baseUrl})
      : _apiService = RestApiService(baseUrl: baseUrl);

  @override
  Future<void> initialize() async {
    // No initialization needed for REST API
  }

  @override
  Future<bool> login(String email, String password) async {
    try {
      final response = await _apiService.post('/login', body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _token = data['token'];
        _apiService.setToken(_token!);
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> logout() async {
    _token = null;
    _apiService.clearToken();
    // Optionally call logout endpoint
    try {
      await _apiService.post('/logout');
    } catch (_) {}
  }

  @override
  bool get isLoggedIn => _token != null;
}